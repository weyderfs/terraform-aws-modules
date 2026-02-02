
variable "name" {
  type        = string
  description = "(Required, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name."
}

variable "assume_role_policy" {
  type        = string
  description = "(Required) Policy that grants an entity permission to assume the role."
}

variable "max_session_duration" {
  type        = string
  default     = 3600
  description = "(Optional) Maximum session duration (in seconds) for the role. Valid range is 1 hour to 12 hours."
}

variable "managed_policy_arns" {
  type        = list(string)
  default     = []
  description = "(Optional) Set of IAM managed policy ARNs to attach to the role."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Key-value mapping of tags for the IAM role."
}
