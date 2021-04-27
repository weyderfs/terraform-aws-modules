resource "aws_elasticache_cluster" "redis" {

  cluster_id                    = var.cluster_id
  engine                        = var.engine
  engine_version                = var.engine_version
  maintenance_window            = var.maintenance_window
  node_type                     = var.node_type
  notification_topic_arn        = var.notification_topic_arn
  num_cache_nodes               = var.num_cache_nodes
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  security_group_ids            = var.security_group_ids
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_group_name             = var.subnet_group_name

  tags  = var.tags

}