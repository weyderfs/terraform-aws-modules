variable "acceptance_required" {
  type        = bool
  default     = true
  description = "(Required) Whether or not VPC endpoint connection requests to the service must be accepted by the service owner"
}

variable "network_load_balancer_arns" {
  type        = list(string)
  description = " (Optional) Amazon Resource Names (ARNs) of one or more Network Load Balancers for the endpoint service."
}

variable "allowed_principals" {
  type        = list(string)
  description = " (Optional) The ARNs of one or more principals allowed to discover the endpoint service."
}

variable "private_dns_name" {
  type        = string
  default     = "none"
  description = "(Optional) The private DNS name for the service."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The maps of tags"
}