terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31"
    }

    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.13.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.profile
  region  = var.region
}