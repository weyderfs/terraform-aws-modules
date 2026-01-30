resource "aws_ecs_cluster" "this" {
  name = var.name

  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? var.container_insights_level : "disabled"
  }

  dynamic "configuration" {
    for_each = var.cluster_configuration != null ? [var.cluster_configuration] : []
    content {
      dynamic "execute_command_configuration" {
        for_each = try(configuration.value.execute_command_configuration, null) != null ? [configuration.value.execute_command_configuration] : []
        content {
          kms_key_id = try(execute_command_configuration.value.kms_key_id, null)
          logging    = try(execute_command_configuration.value.logging, "DEFAULT")

          dynamic "log_configuration" {
            for_each = try(execute_command_configuration.value.log_configuration, null) != null ? [execute_command_configuration.value.log_configuration] : []
            content {
              cloud_watch_log_group_name     = try(log_configuration.value.cloud_watch_log_group_name, null)
              cloud_watch_encryption_enabled = try(log_configuration.value.cloud_watch_encryption_enabled, null)
            }
          }
        }
      }
    }
  }

  dynamic "service_connect_defaults" {
    for_each = var.service_connect_defaults != null ? [var.service_connect_defaults] : []
    content {
      namespace = service_connect_defaults.value.namespace
    }
  }

  tags = var.tags
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name       = aws_ecs_cluster.this.name
  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    content {
      capacity_provider = default_capacity_provider_strategy.value.capacity_provider
      weight            = try(default_capacity_provider_strategy.value.weight, null)
      base              = try(default_capacity_provider_strategy.value.base, null)
    }
  }
}
