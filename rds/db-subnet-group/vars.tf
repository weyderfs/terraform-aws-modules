variable "name" {
  type        = string
  description = "The name of Subnet group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) A list of VPC subnet IDs."
}

variable "description" {
  type        = string
  default     = "Managed by IaC"
  description = "(Optional) The description of the DB subnet group. Defaults to Managed by Terraform."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "The TAG list"
}