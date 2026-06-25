terraform {
  required_version = ">= 1.5.0"

  # Directing Terraform to use the secure storage we just stood up
  backend "s3" {
    bucket         = "hassan-nasir-production-tfstate-bucket"
    key            = "platform/production.tfstate"
    region         = "us-east-1"
    dynamodb_table = "production-tfstate-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = "Production"
      Owner       = "Hassan-Nasir"
      ManagedBy   = "Terraform"
    }
  }
}
