variable "name" {
    type        = string
    description = "The name of Subnet group"
}
variable "subnet_ids"   {
    type        = list(string)
    description = "(Required) A list of VPC subnet IDs."
}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "The TAG list"
}