variable "name" {
    type        = string
    default     = null
    description = "The name of Loadbalancer"
}

variable "ip_address_type" {
    type        = string
    default     = "ipv4"
    description = "(Optional) The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack" 
}

variable "idle_timeout" {
    type    = number
    default = 60
    description = "(Optional) The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60."
  
}

variable "internal" {
    type        = bool
    default     = true
    description = "(Optional) If true, the LB will be internal."
}

variable "security_groups" {
    type        = list(string)
    description = "(Optional) A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application"
}

variable "subnets" {
    type        = list(string)
    default     = []
    description = "(Optional) A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value for load balancers of type network will force a recreation of the resource."
}

variable "enable_deletion_protection" {
    type        = bool
    default     = true
    description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "List of resource tags"
}