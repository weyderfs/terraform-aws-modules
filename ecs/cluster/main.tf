resource "aws_ecs_cluster" "ecscluster" {

  name = var.ecscluster_name

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    content {

      capacity_provider = default_capacity_provider_strategy.value.capacity_provider
      weight            = default_capacity_provider_strategy.value.weight
      base              = default_capacity_provider_strategy.value.base

    }
  }

  setting {

    name  = "containerInsights"
    value = var.container_insights

  }

  tags = var.tags
}
