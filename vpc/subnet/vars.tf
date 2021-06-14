variable "vpc_id" {
    type        = string
    default     = null
    description = "(Required) The VPC ID."
}

variable "cidr_block" {
    type        = string
    description = "(Required) The CIDR block for the subnet."
}

variable "availability_zone" {
    type        = string
    description = "(Optional) The AZ for the subnet."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "The maps of tags"
}
