# Config
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.17"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}