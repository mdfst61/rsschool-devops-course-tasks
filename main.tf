terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "mdfst-rsschool-devops2025"
    key                = "state/terraform.tfstate"
    region         	   = "eu-north-1"
    encrypt        	   = true
  }
}