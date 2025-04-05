
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

module "eks_blue" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.21.0"

  cluster_name    = "eks-blue"
  cluster_version = "1.27"
  subnet_ids      = var.private_subnets
  vpc_id          = var.vpc_id
  enable_irsa = true
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_endpoint_public_access_cidrs = [
    "124.54.31.185/32"
  ]

  eks_managed_node_groups = {
    blue-ng = {
      desired_size = 2
      max_capacity     = 3
      min_capacity     = 2
      instance_types   = ["t3.medium"]
    }
  }

  tags = {
    Environment = "blue"
  }
}
