# terraform {
#   required_version = ">= 0.12"
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {
#     # bucket         = "tfstate-629997802772"
#     # key            = "base/terraform.tfstate"
#     # region         = "us-east-1"
#     # dynamodb_table = "terraform-locks"
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