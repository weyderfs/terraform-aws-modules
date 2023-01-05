variable "name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name."
}
variable "max_session_duration" {
  type        = string
  default     = 3600
  description = "(Optional) Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
}
variable "assume_role_policy" {
  type        = string
  description = "(Required) Policy that grants an entity permission to assume the role."
}
variable "managed_policy_arns" {
  type        = list(string)
  default     = []
  description = "(Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Key-value mapping of tags for the IAM role."
}