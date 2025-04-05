terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name = "eks-bluegreen-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-northeast-2a", "ap-northeast-2c"]

  public_subnets = [
    "10.0.1.0/24", # Blue
    "10.0.2.0/24", # Blue
    "10.0.3.0/24", # Green
    "10.0.4.0/24",  # Green
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]

  enable_nat_gateway = false
  map_public_ip_on_launch = true

  tags = {
    Environment = "bluegreen-lab"
    Terraform   = "true"
  }
}

