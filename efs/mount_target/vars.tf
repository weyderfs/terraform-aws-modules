variable "file_system_id" {
  type        = string
  description = "(Required) The ID of the file system for which the mount target is intended."
}

variable "subnet_id" {
  type        = string
  description = "(Required) The ID of the subnet to add the mount target in."
}

variable "security_groups" {
  type        = list(string)
  description = "(Optional) A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target."
}
