data "aws_s3_bucket" "b" {
    bucket = "gcs-awsht-aws-dv5-1"
}

data "aws_iam_instance_profile" "profile" {
    name = "EC2ImageBuilder"
}

data "aws_vpc" "vpc" {
  id = "vpc-09dc1fcd23d19aaa1"
}

data "aws_subnet" "subnet" {
  id = "subnet-06174b4838fa5905e"
}

data "aws_security_group" "sg" {
  id = "sg-0faf5e2eb7e921da4"
}

data "aws_security_group" "sg1" {
  id = "sg-0ef7c0ac09b3887f9"
}

data "aws_ami" "parent_ami" {

    most_recent = true

    owners = ["self", "amazon", "801119661308"]
    filter {
        name   = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]
    }
}