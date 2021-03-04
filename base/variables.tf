variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-1)"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Environment name for resource naming"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags for resource group"
  type        = map

  default = {
    "env"         = "dev"
    "heritage"    = "terraform"
    "application" = "geoapp"
  }
}

variable "vpc_name" {
  description = "The AWS VPC Name"
  type        = string
  default     = "geoapp-vpc"
}

variable "vpc_cidr" {
  description = "The AWS VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "The AWS Availability Zones Name"
  type        = list
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnet" {
  description = "The AWS Private Subnet"
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet" {
  description = "The AWS Public Subnet"
  type        = list
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
