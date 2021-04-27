variable "name" {
    type        = string
    description = "The name of Parameter Group resource"
}
variable "family" {
    type        = string
    description = "The Family RDS used"
}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "The Tag list"
}