terraform {
  backend "s3" {
    bucket = "c-sharp-terraform-state"
    key    = "state"
    region = "us-east-1"
  }
  aws = {
    required_providers {
    source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



