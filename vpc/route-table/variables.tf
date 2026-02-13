variable "vpc_id" {
    type        = string
    default     = null
    description = "(Required) The VPC ID."
}

variable "routes" {
  type        = list
  default     = []
  description = "(Optional) A list of route objects. Their keys are documented below. This argument is processed in attribute-as-blocks mode."
}

variable "subnet_associations" {
  type        = list
  default     = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The maps of tags"
}
