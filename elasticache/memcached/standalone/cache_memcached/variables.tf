variable "cluster_id" {
    type        = string
    default     = null
    description = "(Required) Group identifier. ElastiCache converts this name to lowercase."
}

variable "engine" {
    type        = string
    default     = null
    description = "(Required) unless replication_group_id is provided) Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis."
}

variable "engine_version" {
    type        = string
    default     = "1.5.16"
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
    default     = 1
    description = "Cluster size"
}

variable "parameter_group_name" {
    type        = string
    default     = null
    description = "(Required unless replication_group_id is provided) Name of the parameter group to associate with this cache cluster."
}

variable "port" {
    type        = number
    default     = 11211
    description = "(Optional) The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. Cannot be provided with replication_group_id." 
}

variable "replication_group_id" {
    type        = string
    default     = null
    description = "(Optional) The ID of the replication group to which this cluster should belong. If this parameter is specified, the cluster is added to the specified replication group as a read replica; otherwise, the cluster is a standalone primary that is not part of any replication group."
}

variable "security_group_ids" {
    type        = list(string)
    default     = []
    description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster."
}

variable "subnet_group_name" {
    type        = string
    default     = null
    description = "(Optional, VPC only) Name of the subnet group to be used for the cache cluster."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "List of Resource tags"
}
