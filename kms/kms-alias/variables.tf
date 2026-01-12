variable "alias_name" {
  type        = string
  description = "Alias name in the form 'alias/your-alias'"
}

variable "description" {
  type        = string
  description = "KMS key description"
  default     = "Managed by Terraform"
}

variable "enable_rotation" {
  type        = bool
  description = "Enable AWS-managed annual rotation for symmetric keys"
  default     = true
}

variable "deletion_window_in_days" {
  type        = number
  description = "KMS key deletion window"
  default     = 30
}

variable "key_policy" {
  type        = string
  description = "Optional JSON policy for the KMS key"
  default     = null
}

# variable "tags" {
#   type        = map(string)
#   description = "A map of tags to assign to the KMS key"
#   default     = {}
# }
