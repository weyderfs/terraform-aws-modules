variable "namespace_name" {
  description = "Name of the private DNS namespace"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the namespace will be created"
  type        = string
}

variable "description" {
  description = "Description of the namespace"
  type        = string
  default     = ""
}

variable "services" {
  description = "Map of services to create in the namespace"
  type = map(object({
    description           = optional(string, "")
    dns_config = object({
      dns_records = list(object({
        ttl  = optional(number, 60)
        type = string
      }))
      routing_policy = optional(string, "MULTIVALUE")
    })
    health_check_custom_config = optional(object({}))
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}