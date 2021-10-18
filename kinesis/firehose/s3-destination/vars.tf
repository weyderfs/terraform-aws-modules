variable "name" {
  type        = string
  description = "(Required) A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
}
variable "kinesis_stream_arn" {
  type        = string
  default     = ""
  description = "(Required) The kinesis stream used as the source of the firehose delivery stream."
}
variable "role_arn" {
  type        = string
  default     = ""
  description = "(Required) The ARN of the role that provides access to the source Kinesis stream."
}
variable "extended_s3_configuration_role_arn" {
  type        = string
  description = "(Required) The ARN of the AWS credentials."
}
variable "extended_s3_configuration_bucket_arn" {
  type        = string
  description = "(Required) The ARN of the S3 bucket"
}
variable "extended_s3_configuration_error_output_prefix" {
  type        = string
  default     = null
  description = "(Optional) Prefix added to failed records before writing them to S3. This prefix appears immediately following the bucket name."
}
variable "extended_s3_configuration_s3_backup_mode" {
  type        = string
  default     = "Disabled"
  description = "(Optional) The Amazon S3 backup mode. Valid values are Disabled and Enabled. Default value is Disabled."
}
variable "processing_configuration_enable" {
  type        = string
  default     = false
  description = "(Optional) Enables or disables data processing."
}
variable "processors_type" {
  type        = string
  default     = ""
  description = "(Required) The type of processor. Valid Values: Lambda"
}
variable "parameter_processor_name" {
  type        = string
  default     = ""
  description = "(Required) Parameter name. Valid Values: LambdaArn, NumberOfRetries, RoleArn, BufferSizeInMBs, BufferIntervalInSeconds"
}
variable "parameter_processor_value" {
  type        = string
  default     = ""
  description = "(Required) Parameter value. Must be between 1 and 512 length (inclusive). When providing a Lambda ARN, you should specify the resource version as well."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The list of resource TAGs"
}