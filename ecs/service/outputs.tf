output "service_name" {
  description = "Name of the ECS Service."
  value       = aws_ecs_service.ese.name
}

output "service_arn" {
  description = "ARN of the ECS Service."
  value       = aws_ecs_service.ese.arn
}

output "service_id" {
  description = "ID of the ECS Service (commonly same as ARN)."
  value       = aws_ecs_service.ese.id
}

output "cluster_arn" {
  description = "ARN/ID of the ECS Cluster associated with the service."
  value       = aws_ecs_service.ese.cluster
}

output "task_definition" {
  description = "Task definition (ARN or family:revision) currently set on the service."
  value       = aws_ecs_service.ese.task_definition
}

output "scheduling_strategy" {
  description = "Scheduling strategy used by the ECS Service (REPLICA or DAEMON)."
  value       = aws_ecs_service.ese.scheduling_strategy
}

output "desired_count" {
  description = "Desired number of tasks (only relevant for REPLICA strategy)."
  value       = aws_ecs_service.ese.desired_count
}

output "launch_type" {
  description = "Launch type configured for the service (FARGATE or EC2), if defined."
  value       = try(aws_ecs_service.ese.launch_type, null)
}

output "platform_version" {
  description = "Fargate platform version if applicable (e.g., LATEST)."
  value       = try(aws_ecs_service.ese.platform_version, null)
}

output "capacity_provider_strategy" {
  description = "Capacity provider strategy applied to the service (if used)."
  value       = try(aws_ecs_service.ese.capacity_provider_strategy, [])
}

output "enable_execute_command" {
  description = "Indicates whether ECS Exec is enabled for this service."
  value       = try(aws_ecs_service.ese.enable_execute_command, false)
}

output "load_balancer" {
  description = "Load balancer block(s) attached to the ECS Service (target group ARN, container name/port)."
  value       = try(aws_ecs_service.ese.load_balancer, [])
}

output "target_group_arn" {
  description = "Target Group ARN used by the service for the configured container."
  value = try(
    one([
      # Filter the set by the container_name taken from module input
      for lb in aws_ecs_service.ese.load_balancer : lb.target_group_arn
      if lb.container_name == try(var.load_balancer[0].container_name, try(var.load_balancer.container_name, null))
    ]),
    null
  )
}

output "lb_container_name" {
  description = "Container name mapped by the load balancer (filtered by configured container_name)."
  value = try(
    one([
      for lb in aws_ecs_service.ese.load_balancer : lb.container_name
      if lb.container_name == try(var.load_balancer[0].container_name, try(var.load_balancer.container_name, null))
    ]),
    null
  )
}

output "lb_container_port" {
  description = "Container port mapped by the load balancer (filtered by configured container_name)."
  value = try(
    one([
      for lb in aws_ecs_service.ese.load_balancer : lb.container_port
      if lb.container_name == try(var.load_balancer[0].container_name, try(var.load_balancer.container_name, null))
    ]),
    null
  )
}

output "network_subnets" {
  description = "Subnets associated with the service (awsvpc network mode)."
  value       = try(aws_ecs_service.ese.network_configuration[0].subnets, null)
}

output "network_security_groups" {
  description = "Security Groups associated with the service (awsvpc network mode)."
  value       = try(aws_ecs_service.ese.network_configuration[0].security_groups, null)
}

output "assign_public_ip" {
  description = "Whether a public IP is assigned to the tasks (awsvpc network mode)."
  value       = try(aws_ecs_service.ese.network_configuration[0].assign_public_ip, null)
}

output "deployment_controller_type" {
  description = "Deployment controller type (ECS or CODE_DEPLOY) if configured."
  value       = try(aws_ecs_service.ese.deployment_controller[0].type, null)
}

output "deployment_circuit_breaker" {
  description = "Deployment circuit breaker configuration (enable/rollback) if configured."
  value = try({
    enable   = aws_ecs_service.ese.deployment_circuit_breaker[0].enable
    rollback = aws_ecs_service.ese.deployment_circuit_breaker[0].rollback
  }, null)
}

output "health_check_grace_period_seconds" {
  description = "Health check grace period used when the service is fronted by a load balancer."
  value       = try(aws_ecs_service.ese.health_check_grace_period_seconds, null)
}

output "enable_ecs_managed_tags" {
  description = "Indicates whether ECS managed tags are enabled for this service."
  value       = try(aws_ecs_service.ese.enable_ecs_managed_tags, null)
}

output "propagate_tags" {
  description = "Source for tag propagation (SERVICE or TASK_DEFINITION), if configured."
  value       = try(aws_ecs_service.ese.propagate_tags, null)
}

output "service_reference" {
  description = "Convenient reference in the form of cluster_arn/service_name."
  value       = "${aws_ecs_service.ese.cluster}/${aws_ecs_service.ese.name}"
}

# Echo the input blocks for composition with external modules (optional but handy)
output "input_load_balancer" {
  description = "Load balancer block provided via module input (echo for composition)."
  value       = try(var.load_balancer, null)
}

output "input_network_configuration" {
  description = "Network configuration block provided via module input (echo for composition)."
  value       = try(var.network_configuration, null)
}
