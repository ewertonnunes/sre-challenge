terraform {
  required_version = ">= 0.13"
}

terraform {
  backend "s3" {
    bucket = "ezton-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}