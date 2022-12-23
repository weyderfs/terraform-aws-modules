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
| [aws_db_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. | `number` | `100` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | (Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | (Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true. | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | (Optional) The AZ for the RDS instance. | `string` | `""` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | (Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. | `number` | `31` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | (Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance\_window. | `string` | `null` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | (Optional) The identifier of the CA certificate for the DB instance. | `string` | `null` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | (Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | (Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed | `bool` | `true` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | (Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. See DBSubnetGroupName in API action CreateDBInstanceReadReplica for additional read replica contraints. | `string` | n/a | yes |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | (Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | (Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is true. | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | (Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The database engine to use | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | (Optional) The engine version to use. If auto\_minor\_version\_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). | `string` | `null` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | (Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica. | `string` | `null` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | (Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `false` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | (Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | (Required) The instance type of the RDS instance. | `string` | `"db.t2.micro"` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | (Optional) The amount of provisioned IOPS. Setting this implies a storage\_type of io1 | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. | `string` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | (Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance. | `string` | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00. | `string` | n/a | yes |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. | `number` | n/a | yes |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | (Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | n/a | yes |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | (Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `string` | n/a | yes |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | (Optional) Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the database to create when the DB instance is created. | `string` | `null` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | (Optional) Name of the DB option group to associate. | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | (Optional) Name of the DB parameter group to associate. | `string` | `""` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | `null` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | (Optional) Specifies whether Performance Insights are enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | (Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance\_insights\_kms\_key\_id, performance\_insights\_enabled needs to be set to true. Once KMS key is set, it can never be changed. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | (Optional) Port to DB. | `number` | n/a | yes |
| <a name="input_replica_mode"></a> [replica\_mode](#input\_replica\_mode) | Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified | `string` | `null` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | `string` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | (Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is false. | `bool` | `false` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | (Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms\_key\_id with a valid ARN | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | (Optional) One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not. | `string` | `"io1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags. | `map(string)` | `{}` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | (Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | The master username for the database. | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | (Optional) List of VPC security groups to associate. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_engine"></a> [engine](#output\_engine) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_port"></a> [port](#output\_port) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END_TF_DOCS -->