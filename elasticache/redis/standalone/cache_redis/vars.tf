variable "cluster_id" {
    type        = string
    default     = null
    description = "(Required) Group identifier. ElastiCache converts this name to lowercase."
}

variable "engine" {
    type        = string
    default     = "redis"
    description = "(Required unless replication_group_id is provided) Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis."
}

variable "engine_version" {
    type        = string
    default     = "5.0.6"
    description = "(Optional) Version number of the cache engine to be used. See Describe Cache Engine Versions in the AWS Documentation center for supported versions."
}

variable "maintenance_window" {
    type        = string
    default     = null
    description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00."
}

variable "node_type" {
    type        = string
    default     = "cache.t2.micro"
    description = "(Required unless replication_group_id is provided) The compute and memory capacity of the nodes. See Available Cache Node Types for supported node types."
}

variable "notification_topic_arn" {
    type        = string
    default     = null
    description = "(Optional) An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic."
}

variable "num_cache_nodes" {    
    type        = number
    description = "Cluster size"
}

variable "security_group_ids" {
    type        = list(string)
    default     = []
    description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster."
}

variable "parameter_group_name" {
    type = string
    description = "(Required unless replication_group_id is provided) Name of the parameter group to associate with this cache cluster"
  
}

variable "subnet_group_name" {
    type        = string
    default     = null
    description = "(Optional, VPC only) Name of the subnet group to be used for the cache cluster."
}

variable "snapshot_window"  {
    type    = string
    default = ""
    description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00"
}

variable "snapshot_retention_limit"  {
    type    = string
    default = 5
    description = "(Optional, Redis only) The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro cache nodes"
}

variable "port" {
    type        = number
    default     = 6379
    description = "(Optional) The port number on which each of the cache nodes will accept connections. The Redis the default port is 6379. Cannot be provided with replication_group_id" 
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "List of Resource TAGS"
}