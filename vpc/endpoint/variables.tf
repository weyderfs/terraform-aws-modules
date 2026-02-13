variable "security_group_ids" {
  type        = list(string)
  description = "(Optional) A list of security group IDs to assign to the Endpoint."
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Optional) A list of subnet group IDs to assign to the Endpoint."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Required) The VPC ID."
}

variable "service_name" {
  type        = string
  default     = null
  description = "(Required) The Endpoint Name."
}

variable "vpc_endpoint_type" {
  type        = string
  default     = "Interface"
  description = "(Required) The Endpoint Type."
}

variable "private_dns_enabled" {
  type        = bool
  default     = true
  description = "(Required) Enable private DNS."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The maps of tags"
}