resource "aws_ecs_service" "ese" {
  name            = var.name
  cluster         = var.cluster_arn
  task_definition = var.task_definition_arn

  scheduling_strategy = var.scheduling_strategy
  desired_count       = var.scheduling_strategy == "REPLICA" ? var.desired_count : null

  enable_execute_command = var.enable_execute_command
  platform_version       = var.platform_version

# Launch type vs Capacity providers (mutually exclusive)
  launch_type = var.launch_type

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = try(capacity_provider_strategy.value.weight, null)
      base              = try(capacity_provider_strategy.value.base, null)
    }
  }

  # Network (mandatory to Fargate / awsvpc)
  dynamic "network_configuration" {
    for_each = var.network_configuration != null ? [var.network_configuration] : []
    content {
      subnets          = network_configuration.value.subnets
      security_groups  = try(network_configuration.value.security_groups, null)
      assign_public_ip = try(network_configuration.value.assign_public_ip, null)
    }
  }

  # Load balancer (opcional)
  dynamic "load_balancer" {
    for_each = var.load_balancer != null ? [var.load_balancer] : []
    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  # Service discovery (Cloud Map)
  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      container_name = try(service_registries.value.container_name, null)
      container_port = try(service_registries.value.container_port, null)
      port           = try(service_registries.value.port, null)
    }
  }

  # Placement strategy (opcional)
  dynamic "ordered_placement_strategy" {
    for_each = var.placement_strategy_type != null ? [1] : []
    content {
      type  = var.placement_strategy_type
      field = var.placement_strategy_field
    }
  }

  # Constraints (opcional)
  dynamic "placement_constraints" {
    for_each = var.placement_constraint_type != null ? [1] : []
    content {
      type       = var.placement_constraint_type
      expression = var.placement_constraint_expression
    }
  }

  dynamic "deployment_controller" {
    for_each = var.deployment_controller != null ? [var.deployment_controller] : []
    content {
      type = deployment_controller.value.type
    }
  }

  dynamic "deployment_circuit_breaker" {
    for_each = var.enable_deployment_circuit_breaker != null ? [var.enable_deployment_circuit_breaker] : []
    content {
      enable   = deployment_circuit_breaker.value.enable
      rollback = deployment_circuit_breaker.value.rollback
    }
  }

  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  propagate_tags        = "SERVICE"   # or "TASK_DEFINITION"
  enable_ecs_managed_tags = true

  tags = var.tags
}
