## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.44 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_distribution_configuration.dist_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_distribution_configuration) | resource |
| [aws_imagebuilder_image_pipeline.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_pipeline) | resource |
| [aws_imagebuilder_image_recipe.recipe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_recipe) | resource |
| [aws_imagebuilder_infrastructure_configuration.infra_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_infrastructure_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_tags"></a> [ami\_tags](#input\_ami\_tags) | A map of tags for the resultant AMI. Should include component versions and parent AMI name. | `map(any)` | n/a | yes |
| <a name="input_components"></a> [components](#input\_components) | A list of ARNs for the components in the recipe. Must be in order of execution. | `list(any)` | n/a | yes |
| <a name="input_dist_ami_name"></a> [dist\_ami\_name](#input\_dist\_ami\_name) | The name of the distributed AMI. | `string` | n/a | yes |
| <a name="input_dist_aws_accounts"></a> [dist\_aws\_accounts](#input\_dist\_aws\_accounts) | A list of AWS Account IDS to distribute the AMI to. | `list(any)` | n/a | yes |
| <a name="input_dist_name"></a> [dist\_name](#input\_dist\_name) | The name of the distribution configuration. | `string` | n/a | yes |
| <a name="input_dist_region"></a> [dist\_region](#input\_dist\_region) | The region where to distribute the image | `string` | n/a | yes |
| <a name="input_infra_config_name"></a> [infra\_config\_name](#input\_infra\_config\_name) | Name of the infrastructure configuration that will run the image. | `string` | n/a | yes |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | The IAM profile that will run the image build. | `string` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | A list of instance types that the AMI will be built on | `list(any)` | n/a | yes |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | The name of the bucket that build logs should be shipped to. | `string` | n/a | yes |
| <a name="input_parent_ami_id"></a> [parent\_ami\_id](#input\_parent\_ami\_id) | AMI ID the image will be based on | `string` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Name of the pipeline that will build the image. | `string` | n/a | yes |
| <a name="input_recipe_name"></a> [recipe\_name](#input\_recipe\_name) | Name of the recipe that will build the image. | `string` | n/a | yes |
| <a name="input_recipe_version"></a> [recipe\_version](#input\_recipe\_version) | Version of the recipe that will build the image. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security groups for the images during the build. | `list(any)` | n/a | yes |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | An SNS topic that the build details will be posted to. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet that the image build will run in | `string` | n/a | yes |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The directory to be used during build/test workflows. | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | A prefix in the logging bucket to separate different build logs. | `string` | `"/"` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | A key pair that can be used to remote into the machine. | `string` | `""` | no |
| <a name="input_terminate_instance_on_failure"></a> [terminate\_instance\_on\_failure](#input\_terminate\_instance\_on\_failure) | Should this image be kept around if it fails during a build (for troubleshooting). | `bool` | `false` | no |

## Outputs

No outputs.
