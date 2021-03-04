variable "aws_region" {
  description = "The AWS region to deploy to (e.g. eu-west-1)"
  type        = string
  default     = "us-east-1"
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

variable "env" {
  description = "Environment name for resource naming"
  type        = string
  default     = "dev"
}

variable "file_system_id" {
  type    = string
  default = ""
}

variable "geo" {
  type    = string
  default = "us"
}

variable "priority" {
  type    = number
}

variable "azs" {
  type    = list
  default = ["az1","az2","az3"]
}

variable "private_subnets" {
  type    = list
  default = ["subnet-1a","subnet-1b","subnet-1c"]
}

variable "listener_arn" {
  description = "Listener ARN for LB"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID for geoapp"
  type        = string
  default     = ""
}

variable "target_group_arn" {
  description = "Target group for geoapp"
  type        = string
  default     = ""
}

variable "file_system_dns" {
  description = "File system dns"
  type        = string
  default     = ""
}

variable "sg_ids" {
  description = "Security group id"
  type        = list
  default     = []
}

variable "ssh_key" {
  description = "Ssh key name in AWS"
  type        = string
  default     = ""
}