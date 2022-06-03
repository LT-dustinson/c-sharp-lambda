terraform {
  backend "s3" {
    bucket = "c-sharp-terraform-state"
    key    = "state"
    region = "us-east-1"
  }
}
###########################################################
# Define any variables that we need to change
###########################################################
variable "region" {
  type = string
}

variable "aws_account" {
  type = string
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



