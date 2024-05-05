terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "ezton-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}