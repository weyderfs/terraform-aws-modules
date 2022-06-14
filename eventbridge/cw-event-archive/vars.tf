variable "name" {
  type        = string
  description = "(Required) The name of the new event archive. The archive name cannot exceed 48 characters."
}
variable "description" {
  type        = string
  description = "(Optional) The description of the new event archive."
}
variable "event_source_arn" {
  type        = string
  description = "(Required) Event bus source ARN from where these events should be archived."
}
variable "retention_days" {
  type        = string
  description = "(Optional) The maximum number of days to retain events in the new event archive. By default, it archives indefinitely."
}
variable "event_pattern" {
  type        = string
  description = "(Optional) Instructs the new event archive to only capture events matched by this pattern. By default, it attempts to archive every event received in the event_source_arn"
}