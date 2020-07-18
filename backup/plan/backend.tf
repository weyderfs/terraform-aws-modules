variable "plan_name" {
    type        = string
    default     = null
    description = "(Required) The display name of a backup plan"
}
variable "plan_rule_name" {
    type        = string
    default     = null
    description = "(Required) An display name for a backup rule."
}
variable "plan_target_vault_name" {
    type        = string
    default     = null
    description = "(Required) The name of a logical container where backups are stored."
}
variable "plan_schedule" {
    type        = string
    default     = null
    description = "(Optional) A CRON expression specifying when AWS Backup initiates a backup job."
}
variable "plan_starting_window" {
    type        = string
    default     = null
    description = "(Optional) The amount of time in minutes before beginning a backup."
}
variable "plan_completion_window" {
    type        = string
    default     = null
    description = "(Optional) The amount of time AWS Backup attempts a backup before canceling the job and returning an error."
}
variable "plan_recovery_point_tags" {
    type        = string
    default     = null
    description = "(Optional) Metadata that you can assign to help organize the resources that you create."
}
variable "lifecycle_cold_storage_after" {
    type        = string
    default     = null
    description = "(Optional) Specifies the number of days after creation that a recovery point is moved to cold storage."
}
variable "lifecycle_delete_after" {
    type        = string
    default     = null
    description = "(Optional) Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after"
}
variable "copy_action_lifecycle" {
    type        = string
    default     = null
    description = "(Optional) The lifecycle defines when a protected resource is copied over to a backup vault and when it expires. Fields documented above."
}
variable "copy_action_destination_vault_arn" {
    type        = string
    default     = null
    description = "(Required) An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup."
}