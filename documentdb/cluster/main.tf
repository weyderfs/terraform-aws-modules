resource "aws_docdb_cluster" "cluster" {

  apply_immediately               = var.cluster_apply_immediately
  availability_zones              = var.cluster_availability_zones
  backup_retention_period         = var.cluster_backup_retention_period
  cluster_identifier              = var.cluster_identifier
  cluster_identifier_prefix       = var.cluster_cluster_identifier_prefix
  db_cluster_parameter_group_name = var.cluster_db_cluster_parameter_group_name
  db_subnet_group_name            = var.cluster_db_subnet_group_name
  deletion_protection             = var.cluster_deletion_protection
  enabled_cloudwatch_logs_exports = var.cluster_enabled_cloudwatch_logs_exports
  engine                          = var.cluster_engine
  engine_version                  = var.cluster_engine_version
  final_snapshot_identifier       = var.cluster_final_snapshot_identifier
  kms_key_id                      = var.cluster_kms_key_id
  master_password                 = var.cluster_master_password
  master_username                 = var.cluster_master_username
  port                            = var.cluster_port
  preferred_backup_window         = var.cluster_preferred_backup_window
  skip_final_snapshot             = var.cluster_skip_final_snapshot
  snapshot_identifier             = var.cluster_snapshot_identifier
  storage_encrypted               = var.cluster_storage_encrypted
  vpc_security_group_ids          = var.cluster_vpc_security_group_ids
  
}
