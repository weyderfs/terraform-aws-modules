<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_rds_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | (Optional) A list of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply. It is recommended to specify 3 AZs or use the lifecycle configuration block ignore\_changes argument if necessary. | `list(string)` | `[]` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | (Optional) The days to retain backups for. Default 1 | `number` | `30` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | (Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier. | `string` | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | (Optional) Name for an automatically created database on cluster creation. | `string` | `""` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | (Optional) The name of the database engine to be used for this DB cluster. Defaults to aurora. Valid Values: aurora, aurora-mysql, aurora-postgresql | `string` | `""` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | (Optional) The database engine version. Updating this argument results in an outage. See the Aurora MySQL and Aurora Postgres documentation for your configured engine to determine this value. For example with Aurora MySQL 2, a potential value for this argument is 5.7.mysql\_aurora.2.03.2. | `string` | `""` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | (Required unless a snapshot\_identifier or replication\_source\_identifier is provided or unless a global\_cluster\_identifier is provided when the cluster is the secondary cluster of a global database) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | `""` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | (Required unless a snapshot\_identifier or replication\_source\_identifier is provided or unless a global\_cluster\_identifier is provided when the cluster is the secondary cluster of a global database) Username for the master DB user. | `string` | `""` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | (Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC. Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00 | `string` | `"04:00-09:00"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->