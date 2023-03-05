terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"

}
terraform {
    backend "s3" {
    bucket = "alaa-s3"
    key    = "key"
    region = "eu-west-1"
  }
}
