variable "name" {
  type        = string
  description = "(Optional) The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
}
variable "description" {
  type        = string
  description = "Description of resource"
}

variable "schedule_expression" {
  type        = string
  default     = null
  description = "(Optional) The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
}

variable "event_pattern" {
  type        = string
  default     = null
  description = "(Optional) The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details."
}