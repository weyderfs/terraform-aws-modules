variable "name_vault" {
  type        = string
  default     = null
  description = "The name of Vault"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "KMS Key that will use to crypt the vault"
}

variable "recovery_points" {
  type        = string
  default     = null
  description = "Number of recovery points stored"
}

variable "name_plan" {
  type        = string
  default     = null
  description = "(Required) The display name of a backup plan."
}

variable "rule_name" {
    type        = string
    default     = null
    description = "(Required) An display name for a backup rule."

}

variable "target_vault_name" {
    type        = string
    default     = null
    description = "(Required) The name of a logical container where backups are stored."

}

variable "cron" {
    type    = string
    default = null
    description = "(Optional) A CRON expression specifying when AWS Backup initiates a backup job."

}

variable "start_window" {
    type        = string
    default     = null
    description = "(Optional) The amount of time in minutes before beginning a backup"

}

variable "completion_window" {
    type        = string
    default     = null
    description = "(Optional) The amount of time AWS Backup attempts a backup before canceling the job and returning an error."
}

variable "lifecycle_plan" {
  type  = string
  default = null
  description = "(Optional) The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. Fields documented below."

}

variable "recovery_point_tags" {
  type    = string
  default = null
  description = " (Optional) Metadata that you can assign to help organize the resources that you create."

}

variable "copy_action" {
  type        = string
  default     = null
  description = "(Optional) Configuration block(s) with copy operation settings. Detailed below."

}

variable "name_selection" {
  type        = string
  default     = null
  description = "(Required) The display name of a resource selection document."

}

variable "plan_id" {
  type        = string
  default     = null
  description = "(Required) The backup plan ID to be associated with the selection of resources."

}

variable  "type_tag" {
  type        = string
  default     = null
  description = "(Required) An operation, such as StringEquals, that is applied to a key-value pair used to filter resources in a selection."

}

variable  "key_tag" {
  type    = string
  default = null
  description = "(Required) The key in a key-value pair."

}

variable "value_key_tag" {
  type        = string
  default     = null
  description = "(Required) The value in a key-value pair."
}






