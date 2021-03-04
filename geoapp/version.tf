# terraform {
#   required_version = ">= 0.12.21"
#   backend "s3" {
#     bucket         = "tfstate-629997802772"
#     key            = "geoapp/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#   }

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 2.70"
#     }
#   }
# }

# provider "aws" {
#   # Live modules pin exact provider version; generic modules let consumers pin the version.
#   region = var.aws_region
# }