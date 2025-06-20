terraform {
  backend "s3" {
    bucket  = "mdfst-rsschool-devops2025"
    key     = "state/terraform.tfstate"
    region  = "eu-north-1"
    encrypt = true
  }
}