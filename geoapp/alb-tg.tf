resource "aws_alb_target_group" "geoapp_target_group" {
  name     = "geoapp-${var.env}-${var.geo}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener_rule" "geoapp_listerner_rule" {
  listener_arn = var.listener_arn
  priority     = var.priority * 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.geoapp_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/${var.geo}"]
    }
  }
}