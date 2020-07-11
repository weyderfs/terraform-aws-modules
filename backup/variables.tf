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


