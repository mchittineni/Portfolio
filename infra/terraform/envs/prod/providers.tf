terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
  }
}

# us-east-1 is required for CloudFront-scoped WAF and ACM certificates.
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "Prod"
      Team        = "MC"
      Project     = "Portfolio-Project"
      ManagedBy   = "Terraform"
    }
  }
}
