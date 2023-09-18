# --------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be passed.
# --------------------------------------------------------------------------------
variable "env" {
  description = "Name of the environment. Example: prod"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket for terraform state."
  type        = string
}

variable "s3_bucket_name" {
  description = "'Name' tag for S3 bucket with terraform state."
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table name for terraform lock."
  type        = string
}
