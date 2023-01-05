variable "name" {
  type        = string
  description = "(Optional) The name of the role policy. If omitted, Terraform will assign a random, unique name."
}
variable "role" {
  type        = string
  description = "(Required) The name of the IAM role to attach to the policy."
}
variable "policy" {
  type        = string
  description = "(Required) The inline policy document. This is a JSON formatted string."
}