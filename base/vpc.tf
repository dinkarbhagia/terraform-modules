module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "geoapp"

  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnet
  public_subnets  = var.public_subnet

  enable_ipv6 = false

  enable_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = var.tags

  vpc_tags = {
    Name = "geoapp-${var.env}"
  }
}