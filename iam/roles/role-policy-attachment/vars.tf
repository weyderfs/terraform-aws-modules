variable "role" {
  type        = string
  default     = null
  description = "(Required) - The name of the IAM role to which the policy should be applied"
}

variable "policy_arn" {
  type        = string
  default     = null
  description = "(Required) - The ARN of the policy you want to apply"
}