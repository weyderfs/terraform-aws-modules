variable "name" {
  type    = string
}

variable "role_arn" {
  type    = string
}

variable "subnets" {
  type    = list
  default = []
}

variable "security_group_ids" {
  type    = list
  default = []
}

variable "enabled_cluster_log_types" {
  type    = list
  default = []
}

variable "eks_version" {
  type    = number
}
variable "endpoint_private_access" {
  type    = bool
}