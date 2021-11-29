variable "allocated_storage" {
    type        = number
    default     = 100
    description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
}

variable "apply_immediately" {
    type        = bool
    default     = false
    description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false."
  
}

variable "availability_zone" {
    type        = string
    default     = ""
    description = "(Optional) The AZ for the RDS instance."
}

variable "storage_type" {
    type        = string
    default     = "io1"
    description = "(Optional) One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not."
}

variable "storage_encrypted" {
    type        = bool    
    default     = true
    description = "(Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN" 
}

variable "engine" {
    type        = string
    default     = null
    description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use"
}

variable "engine_version" {
    type        = string
    default     = null
    description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). "
}

variable "instance_class" {
    type        = string
    default     = "db.t2.micro"
    description = "(Required) The instance type of the RDS instance."
}

variable "name" {
    type        = string
    default     = null
    description = "(Optional) The name of the database to create when the DB instance is created."
}

variable "username" {
    type        = string
    default     = null
    description = "The master username for the database."
}

variable "password" {
    type        = string
    default     = null
    description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}

variable "parameter_group_name" {
    type        = string
    default     = ""
    description = "(Optional) Name of the DB parameter group to associate."
}

variable "option_group_name" {
    type        = string
    default     = null
    description = "(Optional) Name of the DB option group to associate."
}

variable "port" {
    type        = number
    description = "(Optional) Port to DB."
}

variable "vpc_security_group_ids" {
    type        = list(string)
    default     = null
    description = "(Optional) List of VPC security groups to associate."
}

variable "performance_insights_enabled" {
    type        = bool
    default     = false
    description = "(Optional) Specifies whether Performance Insights are enabled. Defaults to false."
}

 variable "performance_insights_kms_key_id" {
     type        = string
     default     = null
     description = "(Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed."
 }

variable "backup_retention_period" {
    type        = number
    default     = 31
    description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. "
}

variable "backup_window" {
    type        = string
    default     = null
    description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window."
}

variable "delete_automated_backups" {
    type        = bool
    default     = true
    description = "(Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true"

}

variable "deletion_protection" {
    type        = bool
    default     = true
    description = "(Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is true." 
}

variable "enabled_cloudwatch_logs_exports" {
    type        = list(string)
    default     = []
    description = "(Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error" 
}

variable "license_model" {
    type        = string
    description = "(Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance."
}

variable "auto_minor_version_upgrade" {
    type        = bool
    default     = true
    description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
}

variable "db_subnet_group_name" {
    type        = string
    description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. See DBSubnetGroupName in API action CreateDBInstanceReadReplica for additional read replica contraints."
}

variable "identifier" {
    type        = string
    default     = null
    description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier."
}

variable "ca_cert_identifier" {
    type        = string
    default     = null
    description = "(Optional) The identifier of the CA certificate for the DB instance."
}

variable "character_set_name" {
    type        = string
    default     = null
    description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed"
}

variable "copy_tags_to_snapshot" {
    type        = bool
    default     = true
    description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed"
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags."
}

variable "timezone" {
    type        = string
    default     = null
    description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed"
}

variable "iops" {
    type        = string
    default     = null
    description = "(Optional) The amount of provisioned IOPS. Setting this implies a storage_type of io1"
}

variable "skip_final_snapshot" {
    type        = bool
    default     = false
    description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
}

variable "final_snapshot_identifier" {
    type        = string
    default     = null
    description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica."
}

variable "max_allocated_storage" {
    type        = number
    description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
}

variable "monitoring_interval" {
    type        = number
    description = "(Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
}

variable "multi_az" {
    type        = bool
    default     = false 
    description = "(Optional) Specifies if the RDS instance is multi-AZ"
}

variable "monitoring_role_arn" {
    type        = string
    description = "(Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
}

variable "iam_database_authentication_enabled" {
    type        = bool
    default     = false 
    description = "(Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
}

variable "maintenance_window" {
    type        = string
    description = "(Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00."
}