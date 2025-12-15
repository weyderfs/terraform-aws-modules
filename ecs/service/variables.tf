
variable "name" {
  description = "ECS Service Name."
  type        = string
}

variable "cluster_arn" {
  description = "ECS Cluster ARN/ID."
  type        = string
}

variable "task_definition_arn" {
  description = "ARN or family:revision of Task Definition."
  type        = string
}

variable "desired_count" {
  description = "Number of tasks desired (for REPLICA only)."
  type        = number
  default     = 1
}

variable "scheduling_strategy" {
  description = "Scheduling strategy (REPLICA or DAEMON)."
  type        = string
  default     = "REPLICA"
}

variable "launch_type" {
  description = "Release type: FARGATE or EC2. Do not use if capacity_provider_strategy is set."
  type        = string
  default     = null
}

variable "capacity_provider_strategy" {
  description = "Capacity provider strategy (e.g., FARGATE/FARGATE_SPOT)."
  type = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default = []
}

variable "platform_version" {
  description = "Fargate platform version (e.g., LATEST)."
  type        = string
  default     = null
}

variable "network_configuration" {
  description = "Network configuration for awsvpc (required for Fargate)."
  type = object({
    subnets         = list(string)
    security_groups = optional(list(string), [])
    assign_public_ip = optional(bool, false)
  })
  default = null
}

variable "load_balancer" {
  description = "Load balancer configuration for the service."
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })
  default = null
}

variable "placement_strategy_type" {
  description = "Type of placement strategy (bin pack, random, spread)."
  type        = string
  default     = null
}

variable "placement_strategy_field" {
  description = "Field for placement (e.g.: cpu, memory, attribute:ecs.availability-zone, etc.)."
  type        = string
  default     = null
}

variable "placement_constraint_type" {
  description = "Constraint type (memberOf, distinctInstance)."
  type        = string
  default     = null
}

variable "placement_constraint_expression" {
  description = "CQL expression for constraint memberOf."
  type        = string
  default     = null
}

variable "enable_execute_command" {
  description = "Enable ECS Exec."
  type        = bool
  default     = false
}

variable "deployment_controller" {
  description = "Deployment controller (ECS or CODE_DEPLOY)."
  type = object({
    type = string
  })
  default = null
}

variable "force_new_deployment" {
  description = "Force a new deployment by changing the task definition."
  type        = bool
  default     = false
}

variable "enable_deployment_circuit_breaker" {
  description = "Enables/Configures the ECS circuit breaker."
  type = object({
    enable   = bool
    rollback = bool
  })
  default = null
}

variable "health_check_grace_period_seconds" {
  description = "Health check period (when using LB)."
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags list."
  type        = map(string)
  default     = {}
}
