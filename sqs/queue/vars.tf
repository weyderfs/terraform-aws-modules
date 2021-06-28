variable "name" {
    type        = string
    default     = null
    description = "(Optional) This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
}

variable "delay_seconds" {
    type        = number
    default     = 0
    description = "(Optional) The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds."
}

variable "max_message_size" {
    type        = number
    default     = 262144
    description = "(Optional) The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)."
}

variable "message_retention_seconds" {
    type        = number
    default     = 345600
    description = "(Optional) The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days)."
}

variable "receive_wait_time_seconds" {
    type        = number
    default     = 0
    description = "(Optional) The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
}

variable "redrive_policy" {
    type        = string
    default     = null 
    description = "(Optional) The JSON policy to set up the Dead Letter Queue. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (5)."
}

variable "fifo_queue" {
    type    = bool
    default = false

}

variable "content_based_deduplication" {
    type    = bool
    default = false
    description = "(Optional) Enables content-based deduplication for FIFO queues."
}

variable "kms_master_key_id" {
    type    = string
    default = null
    description = "(Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK"
}

variable "kms_data_key_reuse_period_seconds" {
    type        = number
    default     = 60
    description = "(Optional) The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes)."
}

variable "policy" {
    type        = string
    default     = null
    sensitive   = true
    description = "(Optional) The JSON policy for the SQS queue."
}

variable "visibility_timeout_seconds" {
    type        = number
    default     = 30
    description = "(Optional) The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see AWS docs."
    validation {
        condition     = var.visibility_timeout_seconds < 43200
        error_message = "The visibility_timeout_seconds value must be lower than 43200."
    }
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "List of resource TAGS"
}
