variable "allocated_storage" {
    type        = number
    default     = 10
    description = "(Optional, Default: 50, Min: 5, Max: 6144) The amount of storage (in gigabytes) to be initially allocated for the replication instance."
}

variable "allow_major_version_upgrade" {
    type        = bool
    default     = false
    description = "(Optional, Default: false) Indicates that major version upgrades are allowed."
}

variable "apply_immediately" {
    type        = bool
    default     = false
    description = "(Optional, Default: false) Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource."  
}

variable "auto_minor_version_upgrade" {
    type        = bool
    default     = false
    description = "(Optional, Default: false) Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window."
}

variable "availability_zone" {
    type        = string
    default     = "us-east-1"
    description = "(Optional) The EC2 Availability Zone that the replication instance will be created in."
}

variable "engine_version" {
    type        = string
    default     = "3.4.2"
    description = "(Optional) The engine version number of the replication instance."
}

variable "kms_key_arn" {
    type        = string
    default     = ""
    description = "(Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region."
}

variable "multi_az" {
    type        = bool
    default     = true
    description = "(Optional) Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true"
}

variable "preferred_maintenance_window" {
    type        = string
    default     = "sun:10:30-sun:14:30"
    description = "(Optional) The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC)"
}

variable "publicly_accessible" {
    type        = bool
    default     = false
    description = "(Optional, Default: false) Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address."
}

variable "replication_instance_class" {
    type        = string
    default     = "dms.t3.medium"
    description = "(Required) The compute and memory capacity of the replication instance as specified by the replication instance class. Can be one of dms.t3.small | dms.t3.medium | dms.t3.large | dms.c5.large | dms.c5.xlarge | dms.c5.2xlarge | dms.c5.4xlarge"
}

variable "replication_instance_id" {
    type        = string
    default     = ""
    description = "(Required) The replication instance identifier. This parameter is stored as a lowercase string."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "List of resource TAGS"
}

variable "replication_subnet_group_id" {
  type    = string
  default = ""
  description = "(Optional) A subnet group to associate with the replication instance."
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
  description = "(Optional) A list of VPC security group IDs to be used with the replication instance. The VPC security groups must work with the VPC containing the replication instance."
}
