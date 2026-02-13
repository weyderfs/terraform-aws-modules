variable "name" {
  type        = string
  description = "(Required) The name of the new event bus. The names of custom event buses can't contain the / character. To create a partner event bus, ensure the name matches the event_source_name."
}
variable "event_source_name" {
  type        = string
  default     = null
  description = "(Optional) The partner event source that the new event bus will be matched with. Must match name."
}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags"
}