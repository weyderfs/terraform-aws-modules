resource "aws_elasticache_replication_group" "erg" {

  automatic_failover_enabled    = var.automatic_failover_enabled
  availability_zones            = var.availability_zones
  engine_version                = var.engine_version
  maintenance_window            = var.maintenance_window
  multi_az_enabled              = var.multi_az_enabled
  node_type                     = var.node_type
  number_cache_clusters         = var.number_cache_clusters
  parameter_group_name          = var.parameter_group_name
  port                          = var.port
  replication_group_description = var.replication_group_description
  replication_group_id          = var.replication_group_id
  security_group_ids            = var.security_group_ids
  security_group_names          = var.security_group_names
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  subnet_group_name             = var.subnet_group_name

  dynamic "cluster_mode" {
    for_each = var.cluster_mode_enabled ? [1] : []
    content {
      replicas_per_node_group = var.replicas_per_node_group
      num_node_groups         = var.num_node_groups
    }
  }

  tags = var.tags
}
