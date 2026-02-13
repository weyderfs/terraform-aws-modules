variable "name"{
    type        = string
    description = "The name of the CloudWatch Log Group"
}
  
variable "retention_in_days"  {
    type        = number
    description = "The number of days to retain log events in the specified log group."
    default     = 15
}

variable "kms_key_id" {
    type        = string
    description = "The ARN of the KMS key to use for encrypting log data. If not provided, logs are not encrypted."
    default     = null
}

variable "tags" {
    type        = map(string)
    description = "A map of tags to assign to the log group."
    default     = {}
}