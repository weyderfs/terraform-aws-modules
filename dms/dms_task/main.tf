resource "aws_dms_replication_task" "task" {
  replication_task_id = var.replication_task_id
  replication_instance_arn = var.replication_instance_arn
  source_endpoint_arn = var.source_endpoint_arn
  target_endpoint_arn = var.target_endpoint_arn
  migration_type = var.migration_type
  replication_task_settings = var.replication_task_settings
  table_mappings = var.table_mappings
  tags = var.tags
}