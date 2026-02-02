variable "name" {
    type        = string
    default     = null
    description = "(Optional, Forces new resource) The name of the policy. If omitted, Terraform will assign a random, unique name."
}

variable "path" {
    type        = string
    default     = "/"
    description = "(Optional, default /) Path in which to create the policy."
}

variable "description" {
    type        = string
    default     = null
    description = "(Optional, Forces new resource) Description of the IAM policy."
}

variable "policy" {
    type        = string
    description = "(Required) The policy document. This is a JSON formatted string."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "Tags to apply to the policy."
}

variable "role_name" {
    type        = string
    default     = null
    description = "(Optional) IAM role name to attach this policy to."
}

