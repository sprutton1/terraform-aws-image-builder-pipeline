terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "gcsnonprod-admin"
}