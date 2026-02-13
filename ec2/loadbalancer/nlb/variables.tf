variable "name" {
    type        = string
    default     = null
    description = "(Optional) The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen. If not specified, Terraform will autogenerate a name beginning with tf-lb"
}
variable "internal" {
    type        = bool
    default     = true
    description = "(Optional) If true, the LB will be internal."
}
variable "subnets"  {
    type        = list(string)
    default     = []
    description = "(Optional) A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value for load balancers of type network will force a recreation of the resource."
}
variable "enable_deletion_protection"   {
    type        = bool
    default     = true
    description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
}
variable "subnet_mapping"   {
    type        = map
    default     = {} 
    description = "(Optional) A subnet mapping block as documented: subnet_id - (Required) The id of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone. allocation_id - (Optional) The allocation ID of the Elastic IP address.private_ipv4_address - (Optional) A private ipv4 address within the subnet to assign to the internal-facing load balancer."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "The list of recource tags"

}