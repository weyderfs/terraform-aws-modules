variable "name" {
    type        = string
    description = "(Required) This is the name of the hosted zone."
}

variable "comment" {
    type        = string
    description = "(Optional) A comment for the hosted zone. Defaults to 'Managed by Terraform'."
    default     = "Managed by Terraform"
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags."
}

variable "vpcs" {
    type = list(object({
        vpc_id = string
        vpc_region = string
    }))
    description = "(Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone."
}
