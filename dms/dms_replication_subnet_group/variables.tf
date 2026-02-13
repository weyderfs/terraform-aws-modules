variable "replication_subnet_group_description" {
    type        = string
    default     = ""
    description = "(Required) The description for the subnet group."
}

variable "replication_subnet_group_id" {
    type        = string
    default     = ""
    description = "(Required) The name for the replication subnet group. This value is stored as a lowercase string."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "List of resource TAGS"
}

variable "subnet_ids" {
  type    = list(string)
  default = []
  description = "(Required) A list of the EC2 subnet IDs for the subnet group."
}

