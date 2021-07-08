resource "aws_imagebuilder_image_pipeline" "pipeline" {

  name                             = var.pipeline_name
  image_recipe_arn                 = aws_imagebuilder_image_recipe.recipe.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infra_config.arn
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.dist_config.arn

}

resource "aws_imagebuilder_image_recipe" "recipe" {

  name         = var.recipe_name
  parent_image = var.parent_ami_id
  version      = var.recipe_version

  working_directory = var.working_directory

  dynamic "component" {
    for_each = var.components
    content {
      component_arn = component.value
    }
  }

}

resource "aws_imagebuilder_infrastructure_configuration" "infra_config" {

  name                          = var.infra_config_name
  instance_profile_name         = var.instance_profile_name
  instance_types                = var.instance_types
  key_pair                      = var.key_pair
  security_group_ids            = var.security_group_ids
  sns_topic_arn                 = var.sns_topic_arn
  subnet_id                     = var.subnet_id
  terminate_instance_on_failure = var.terminate_instance_on_failure

  logging {
    s3_logs {
      s3_bucket_name = var.logging_bucket
      s3_key_prefix  = var.bucket_prefix
    }
  }

}

resource "aws_imagebuilder_distribution_configuration" "dist_config" {

  name = var.dist_name

  distribution {
    ami_distribution_configuration {
      ami_tags = var.ami_tags

      name = var.dist_ami_name

      launch_permission {
        user_ids = var.dist_aws_accounts
      }
    }

    region = var.dist_region
  }
}
