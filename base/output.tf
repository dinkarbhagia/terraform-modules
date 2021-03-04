#EFS
output "file_system_id" {
  description = "The ID of the EFS"
  value       = aws_efs_file_system.efs.id
}

output "file_system_dns" {
  description = "The ID of the EFS"
  value       = aws_efs_file_system.efs.dns_name
}

# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

#ALB Listener
output "listener_arn" {
  description = "A list of availability zones spefified as argument to this module"
  value       = aws_lb_listener.geoapp_listener.id
}

#AWS Security Group
output "aws_security_group" {
  description = "A list of availability zones spefified as argument to this module"
  value       = [aws_security_group.sg.id]
}