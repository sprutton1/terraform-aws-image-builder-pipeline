module "pipeline" {
  source = "../"

  ami_tags                      = local.ami_tags
  bucket_prefix                 = "/test"
  components                    = local.component_list
  dist_ami_name                 = "test_ami"
  dist_aws_accounts             = ["638584477967"]
  dist_config_name              = "dist config"
  dist_region                   = "us-west-2"
  infra_config_name             = "infra config"
  instance_profile_name         = data.aws_iam_instance_profile.profile.name
  instance_types                = ["m5.large"]
  key_pair                      = " "
  logging_bucket                = data.aws_s3_bucket.b.bucket
  parent_ami_id                 = "arn:aws:imagebuilder:us-west-2:aws:image/windows-server-2019-english-full-base-x86/x.x.x"
  pipeline_name                 = "test_pipeline"
  recipe_name                   = "test recipe"
  recipe_version                = "0.0.1"
  security_group_ids            = [data.aws_security_group.sg.id, data.aws_security_group.sg1.id]
  sns_topic_arn                 = null
  subnet_id                     = data.aws_subnet.subnet.id
  terminate_instance_on_failure = false
  working_directory             = null
}

resource "aws_imagebuilder_component" "dotnet48" {
  data = file("./components/dotnet48.yaml")

  name     = "dotnet48-test"
  platform = "Windows"
  version  = "1.0.0"

  tags = {
      "installed:dotnet48": "4.8.0.11"
  }
}

locals {
    component_list = [aws_imagebuilder_component.dotnet48.arn]
    component_tags = aws_imagebuilder_component.dotnet48.tags
    
    parent_ami_tags =  { for k,v in data.aws_ami.parent_ami.tags: k => v if ! contains(values(k), "Ec2ImageBuilderArn")}
    
    ami_tags = merge(local.component_tags, local.parent_ami_tags)
}