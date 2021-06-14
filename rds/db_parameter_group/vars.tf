variable "name" {
    type        = string
    description = "The name of Parameter Group resource"
}

variable "family" {
    type        = string
    description = "The Family RDS used"
}

variable "parameter" {
    type        = list(string)
    description = "(Optional) A list of DB parameters to apply. Note that parameters may differ from a family to an other."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "The Tag list"
}