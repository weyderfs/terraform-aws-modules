variable "name" {
  type        = string
  description = "(Required) Name for the cache subnet group. Elasticache converts this name to lowercase."
}

variable "description" {
  type        = string
  description = "(Optional) Description for the cache subnet group. Defaults to Managed by Terraform."
}

variable "subnet_ids" {
  type        = any
  default     = []
  description = "(Required) List of VPC Subnet IDs for the cache subnet group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Required) List of VPC Subnet IDs for the cache subnet group"
}