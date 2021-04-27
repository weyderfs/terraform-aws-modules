resource "aws_db_instance" "db" {

  allocated_storage                   = var.allocated_storage
  apply_immediately                   = var.apply_immediately
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  availability_zone                   = var.availability_zone
  backup_retention_period             = var.backup_retention_period
  backup_window                       = var.backup_window
  ca_cert_identifier                  = var.ca_cert_identifier
  character_set_name                  = var.character_set_name
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  db_subnet_group_name                = var.db_subnet_group_name
  delete_automated_backups            = var.delete_automated_backups
  deletion_protection                 = var.deletion_protection
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_version                      = var.engine_version
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  identifier                          = var.identifier
  instance_class                      = var.instance_class
  iops                                = var.iops
  license_model                       = var.license_model
  max_allocated_storage               = var.max_allocated_storage
  maintenance_window                  = var.maintenance_window
  monitoring_interval                 = var.monitoring_interval
  monitoring_role_arn                 = var.monitoring_role_arn
  multi_az                            = var.multi_az
  name                                = var.name
  option_group_name                   = var.option_group_name
  parameter_group_name                = var.parameter_group_name
  password                            = var.password
  performance_insights_enabled        = var.performance_insights_enabled
  performance_insights_kms_key_id     = var.performance_insights_kms_key_id
  port                                = var.port
  skip_final_snapshot                 = var.skip_final_snapshot
  storage_encrypted                   = var.storage_encrypted
  storage_type                        = var.storage_type
  tags                                = var.tags
  timezone                            = var.timezone 
  username                            = var.username
  vpc_security_group_ids              = var.vpc_security_group_ids
  
}