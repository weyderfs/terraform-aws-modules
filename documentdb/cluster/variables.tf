  variable "cluster_apply_immediately" {
      type          = bool
      default       = false
      description   = "(Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false."
  }
  variable "cluster_availability_zones" {
      type          = string
      default       = null
      description   = "(Optional) A list of EC2 Availability Zones that instances in the DB cluster can be created in."
  }
  variable "cluster_backup_retention_period" {
      type          = string
      default       = null
      description   = "(Optional) The days to retain backups for. Default 1"
  }
  variable "cluster_identifier" {
      type          = string
      default       = null
      description   = "(Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  }
  variable "cluster_cluster_identifier_prefix" {
      type          = string
      default       = null
      description   = "(Optional, Forces new resource) Creates a unique cluster identifier beginning with the specified prefix. Conflicts with cluster_identifier."
  }
  variable "cluster_db_cluster_parameter_group_name" {
      type          = string
      default       = null
      description   = "(Optional) A cluster parameter group to associate with the cluster."
  }
  variable "cluster_db_subnet_group_name" {
      type          = string
      default       = null
      description   = "(Optional) A DB subnet group to associate with this DB instance."
  }
  variable "cluster_deletion_protection" {
      type          = string
      default       = "disabled"
      description   = "(Optional) A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled."
  }
  variable "cluster_enabled_cloudwatch_logs_exports" {
      type          = string
      default       = null
      description   = "(Optional) List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler."
  }
  variable "cluster_engine" {
      type          = string
      default       = null
      description   = "(Optional) The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid Values: docdb"
  }
  variable "cluster_engine_version" {
      type          = string
      default       = null
      description   = "(Optional) The database engine version. Updating this argument results in an outage."
  }
  variable "cluster_final_snapshot_identifier" {
      type          = string
      default       = null
      description   = "(Optional) The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made."
  }
  variable "cluster_kms_key_id" {
      type          = string
      default       = null
      description   = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true."
  }
  variable "cluster_master_password" {
      type          = string
      default       = null
      description   = "(Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocDB Naming Constraints."
  }
  variable "cluster_master_username" {
      type          = string
      default       = null
      description   = "(Required unless a snapshot_identifier is provided) Username for the master DB user."
  }
  variable "cluster_port" {
      type          = string
      default       = null
      description   = "(Optional) The port on which the DB accepts connections."
  }
  variable "cluster_preferred_backup_window" {
      type          = string
      default       = null
      description   = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00."
  }
  variable "cluster_skip_final_snapshot" {
      type          = string
      default       = null
      description   = "(Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false."
  }
  variable "cluster_snapshot_identifier" {
      type          = string
      default       = null
      description   = "(Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot."
  }
  variable "cluster_storage_encrypted" {
      type          = bool
      default       = false
      description   = "(Optional) Specifies whether the DB cluster is encrypted. The default is false."
  }
  variable "cluster_vpc_security_group_ids" {
      type          = string
      default       = null
      description   = "(Optional) List of VPC security groups to associate with the Cluster."
  }