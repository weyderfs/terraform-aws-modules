variable "bucket" {
  type        = string
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "The resource Tags"
}
variable "acl" {
  type        = string
  default     = "private"
  description = "(Optional, Conflicts with access_control_policy) The canned ACL to apply to the bucket."
}