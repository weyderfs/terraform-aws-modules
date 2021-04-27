variable "name" {
    type        = string
    description = "The name of SG"
}
variable "description"  {
    type        = string
    description = "Fo what you be use this SG?"
}

variable "revoke_rules_on_delete" {
    type        = bool
    default     = true
    description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first."
}
variable "vpc_id"   {
    type        = string
    description = "The VPC ID" 
}
variable "ingress" {
    type = list(object({
       description = string,
       from_port   = number,
       to_port     = number,
       protocol    = string
       cidr_blocks = list(string)
    }))
    default     = []
    description = "Ingress Rules"
}
variable "egress" {
    type = list(object({
       description = string,
       from_port   = number,
       to_port     = number,
       protocol    = string
       cidr_blocks = list(string)
    }))
    default     = []
    description = "Egress Rules"
}
variable "tags" {
    type        = map(string)
    default     = null
    description = "The tags of resource"
}