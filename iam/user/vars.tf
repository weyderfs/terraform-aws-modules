variable "name" {
    type        = string 
    default     = null
    description = "(Required) The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. User names are not distinguished by case. For example, you cannot create users named both TESTUSER and testuser."
}
variable "path" {
    type        = string
    default     = "/"
    description = "(Optional, default /) Path in which to create the user."
}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "Key-value map of tags for the IAM user"
}

variable "policy" {
    description = "policy - (Optional) A valid bucket policy JSON document."
}

variable "policy_name" {
    type        = string
    default     = "user_policy"
}

