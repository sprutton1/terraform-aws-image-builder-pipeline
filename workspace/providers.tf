terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "gcsnonprod-admin"
}