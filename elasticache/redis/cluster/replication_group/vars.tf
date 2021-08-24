variable "automatic_failover_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If true, Multi-AZ is enabled for this replication group. If false, Multi-AZ is disabled for this replication group. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false."
}

variable "availability_zones" {
  type        = list(string)
  default     = [] 
  description = "(Optional) A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
}

variable "engine_version" {
  type        = string
  description = "(Optional) The version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "replication_group_id" {
  type        = string
  description = "value"
}

variable "replication_group_description" {
  type        = string
  description = "(Required) A user-created description for the replication group."
}

variable "maintenance_window" {
  type        = string
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
}

variable "node_type" {
  type        = string
  description = "(Required) The compute and memory capacity of the nodes in the node group."
}

variable "number_cache_clusters" {
  type        = number
  default     = 2
  description = "(Required for Cluster Mode Disabled) The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications."
}

variable "parameter_group_name" {
  type        = string
  description = "(Optional) The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used."
}

variable "port" {
  type        = number
  default     = 6379
  description = " (Optional) The port number on which each of the cache nodes will accept connections, for Redis the default port is 6379."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "(Optional) One or more Amazon VPC security groups associated with this replication group. Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud"
}

variable "security_group_names" {
  type    = list(string)
  default = []
  description = "(Optional) A list of cache security group names to associate with this replication group."
}

variable "snapshot_retention_limit" {
  type        = number
  default     = 0
  description = "(Optional, Redis only) The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
}

variable "snapshot_window" {
  type        = string
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"

}

variable "subnet_group_name" {
  type        = string
  description = "(Optional) The name of the cache subnet group to be used for the replication group."

}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The list of resource tags"

}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Enable creation of a native redis cluster."
  default     = false
}

variable "multi_az_enabled" {
  type        = bool
  description = "Enable multi AZ deployment."
  default     = false
}