variable "name" {
  type        = string
  default     = null
  description = " (Required) The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. Group names are not distinguished by case. For example, you cannot create groups named both ADMINS and admins."
}
variable "path" {
  type        = string
  default     = "/"
  description = "(Optional, default /) Path in which to create the group."
}