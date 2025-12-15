
output "task_definition_arn" {
  description = "Registered Task Definition ARN."
  value       = aws_ecs_task_definition.etd.arn
}

output "task_definition_family" {
  description = "Task Definition Name (family)."
  value       = aws_ecs_task_definition.etd.family
}

output "task_definition_revision" {
  description = "Task Definition Revision."
  value       = aws_ecs_task_definition.etd.revision
}

output "task_definition" {
  description = "Full name to use in services/run-task (ex.: family:revision)."
  value       = "${aws_ecs_task_definition.etd.family}:${aws_ecs_task_definition.etd.revision}"
}

output "requires_compatibilities" {
  description = "List of compatibilities (FARGATE/EC2) associated with the Task."
  value       = aws_ecs_task_definition.etd.requires_compatibilities
}

output "network_mode" {
  description = "Network mode configured for Task Definition."
  value       = aws_ecs_task_definition.etd.network_mode
}

output "task_cpu" {
  description = "CPU Task Definition."
  value       = aws_ecs_task_definition.etd.cpu
}

output "task_memory" {
  description = "Memory Task Definition (MiB)."
  value       = aws_ecs_task_definition.etd.memory
}

output "execution_role_arn" {
  description = "Execution role ARN (used by ECS agent)."
  value       = aws_ecs_task_definition.etd.execution_role_arn
}

output "task_role_arn" {
  description = "ARN of the task role assumed by the containers."
  value       = aws_ecs_task_definition.etd.task_role_arn
}

output "container_definitions_json" {
  description = "JSON of container definitions successfully registered."
  value       = aws_ecs_task_definition.etd.container_definitions
  sensitive   = true
}

output "container_names" {
  description = "Lista de nomes dos containers registrados na task definition."
  value       = try([for c in jsondecode(aws_ecs_task_definition.etd.container_definitions) : c.name], [])
}
output "volumes" {
  description = "List of volumes configured in the Task (host_path/Docker/EFS)."
  value       = aws_ecs_task_definition.etd.volume
}

