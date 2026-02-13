variable "name" {
    type        = string
    default     = ""
    description = "(Required) The name of the log stream. Must not be longer than 512 characters and must not contain :"
}

variable "log_group_name" {
    type        = string
    default     = ""
    description = "(Required) The name of the log group under which the log stream is to be created."
}

