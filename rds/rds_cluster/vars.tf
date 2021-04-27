variable "cluster_identifier"   {
    type        = string
    default     = null
    description = "(Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
}
variable "engine"   {
    type        = string
    default     = "" 
    description = "(Optional) The name of the database engine to be used for this DB cluster. Defaults to aurora. Valid Values: aurora, aurora-mysql, aurora-postgresql"
}
variable "engine_version"   {
    type    = string
    default = ""
    description = "(Optional) The database engine version. Updating this argument results in an outage. See the Aurora MySQL and Aurora Postgres documentation for your configured engine to determine this value. For example with Aurora MySQL 2, a potential value for this argument is 5.7.mysql_aurora.2.03.2."
}
variable "availability_zones"   {
    type    = list(string)
    default = []
    description = "(Optional) A list of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply. It is recommended to specify 3 AZs or use the lifecycle configuration block ignore_changes argument if necessary."
}
variable "database_name"    {
    type    = string
    default = ""
    description = "(Optional) Name for an automatically created database on cluster creation."
}
variable "master_username"  {
    type    = string
    default = ""
    description = "(Required unless a snapshot_identifier or replication_source_identifier is provided or unless a global_cluster_identifier is provided when the cluster is the secondary cluster of a global database) Username for the master DB user. "
}
variable "master_password"  {
    type    = string
    default = ""
    description = "(Required unless a snapshot_identifier or replication_source_identifier is provided or unless a global_cluster_identifier is provided when the cluster is the secondary cluster of a global database) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}
variable "backup_retention_period"  {
    type    = number
    default = 30
    description = "(Optional) The days to retain backups for. Default 1"
}
variable "preferred_backup_window"  {
    type    = string
    default = "04:00-09:00"
    description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC. Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00"
}