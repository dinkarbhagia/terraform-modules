resource "aws_placement_group" geoapp {
  name     = "geoapp-${var.env}-${var.geo}"
  strategy = "cluster"
}

data "template_file" "geoapp_user_data" {
  template = file("${path.module}/templates/launch_config_user_data.tpl")

  vars = {
    file_system_dns      = var.file_system_dns
    geo                  = var.geo
  }
}

resource "aws_launch_configuration" "geoapp_launch_config" {
  name_prefix          = "geoapp-${var.env}-${var.geo}"
  image_id             = "ami-0915bcb5fa77e4892"
  instance_type        = "t2.micro"
  security_groups      = var.sg_ids

  root_block_device {
    volume_size = "8"
  }

  # security_groups = ["${var.app_sg}"]
  key_name        = var.ssh_key
  user_data       = data.template_file.geoapp_user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "geoapp" {
  vpc_zone_identifier = var.private_subnets
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1

  launch_configuration = aws_launch_configuration.geoapp_launch_config.id
}

resource "aws_autoscaling_attachment" "geoapp_autoscaling_attachement" {
  autoscaling_group_name = aws_autoscaling_group.geoapp.id
  alb_target_group_arn   = aws_alb_target_group.geoapp_target_group.arn
}