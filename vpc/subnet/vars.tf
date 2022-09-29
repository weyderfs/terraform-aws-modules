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

variable "map_public_ip_on_launch" {
    type    = bool
    default = false
    description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
}