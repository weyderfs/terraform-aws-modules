variable "name"{
    type        = string
    description = "The name of the CloudWatch Log Group"
}
  
variable "retention_in_days"  {
    type        = number
    description = "The number of days to retain log events in the specified log group."
    default     = 15
}

variable "tags" {
    type        = map(string)
    description = "A map of tags to assign to the log group."
    default     = {}
}