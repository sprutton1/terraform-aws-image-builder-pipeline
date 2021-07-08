# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED MODULE PARAMETERS
# These variables must be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "ami_tags" {
  description = "A map of tags for the resultant AMI. Should include component versions and parent AMI name."
  type        = map(any)
}

variable "components" {
  description = "A list of ARNs for the components in the recipe. Must be in order of execution."
  type        = list(any)
}

variable "dist_ami_name" {
  description = "The name of the distributed AMI."
  type        = string
}

variable "dist_aws_accounts" {
  description = "A list of AWS Account IDS to distribute the AMI to."
  type        = list(any)
}

variable "dist_name" {
  description = "The name of the distribution configuration."
  type        = string
}

variable "dist_region" {
  description = "The region where to distribute the image"
  type        = string
}

variable "infra_config_name" {
  description = "Name of the infrastructure configuration that will run the image."
  type        = string
}

variable "instance_profile_name" {
  description = "The IAM profile that will run the image build."
  type        = string
}

variable "instance_types" {
  description = "A list of instance types that the AMI will be built on"
  type        = list(any)
}

variable "logging_bucket" {
  description = "The name of the bucket that build logs should be shipped to."
  type        = string
}

variable "parent_ami_id" {
  description = "AMI ID the image will be based on"
  type        = string
}

variable "pipeline_name" {
  description = "Name of the pipeline that will build the image."
  type        = string
}

variable "recipe_name" {
  description = "Name of the recipe that will build the image."
  type        = string
}

variable "recipe_version" {
  description = "Version of the recipe that will build the image."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security groups for the images during the build."
  type        = list(any)
}

variable "sns_topic_arn" {
  description = "An SNS topic that the build details will be posted to."
  type        = string
}

variable "subnet_id" {
  description = "Subnet that the image build will run in"
  type        = string
}

variable "working_directory" {
  description = "The directory to be used during build/test workflows."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------
variable "bucket_prefix" {
  description = "A prefix in the logging bucket to separate different build logs."
  type        = string
  default     = "/"
}

variable "key_pair" {
  description = "A key pair that can be used to remote into the machine."
  type        = string
  default     = ""
}

variable "terminate_instance_on_failure" {
  description = "Should this image be kept around if it fails during a build (for troubleshooting)."
  type        = bool
  default     = false
}