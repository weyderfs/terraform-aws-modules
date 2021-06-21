variable "bucket" {
    type        = string
    description = "(Required) The name of the bucket to put notification configuration."
}

variable "queue_arn" {
    type        = string
    description = "(Required) Specifies Amazon SQS queue ARN."
}

variable "events" {
    type        = list(string)
    default     = []
    description = "(Required) Specifies event for which to send notifications."
}

variable "filter_prefix" {
    type        = string
    default     = null
    description = "(Optional) Specifies object key name prefix."
}

variable "filter_suffix" {
    type        = string
    default     = null
    description = "(Optional) Specifies object key name sufix."
}