resource "aws_efs_file_system" "efs" {
  creation_token = "geoapp-efs-${var.env}"
  tags = var.tags
}

resource "aws_efs_mount_target" "mount" {
  count          = length(module.vpc.private_subnets) 
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = module.vpc.private_subnets[count.index]
  security_groups = [aws_security_group.sg.id]
}