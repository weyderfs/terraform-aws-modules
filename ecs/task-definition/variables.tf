
variable "family" {
  description = "(Required) Unique name for the task definition."
  type        = string
}

variable "container_definitions" {
  type        = string
  description = "Raw JSON for container_definitions. If null/empty, jsonencode(var.containers) will be used."
  default     = null
}


variable "containers" {
  description = "(Optional) Structured container definitions to be jsonencoded when container_definitions is empty."
  type = list(object({
    name         = string
    image        = string
    cpu          = number
    memory       = number
    essential    = bool
    portMappings = optional(list(object({
      containerPort = number
      hostPort      = optional(number)
      protocol      = optional(string, "tcp")
    })), [])
    environment  = optional(list(object({
      name  = string
      value = string
    })), [])
    secrets = optional(list(object({
      name      = string
      valueFrom = string
    })), [])    
    logConfiguration = optional(object({
      logDriver = string
      options   = optional(map(string), {})
    }), null)
    healthCheck = optional(object({
    command     = list(string)
    interval    = optional(number, 30)
    timeout     = optional(number, 5)
    retries     = optional(number, 3)
    startPeriod = optional(number)
    }), null)
}))
  default = []
}

variable "requires_compatibilities" {
  description = "Launch type compatibilities (e.g., [\"FARGATE\"], [\"EC2\"])."
  type        = list(string)
  default     = ["FARGATE"]
}

variable "network_mode" {
  description = "Task network mode (awsvpc for Fargate)."
  type        = string
  default     = "awsvpc"
}

variable "task_cpu" {
  description = "Total CPU for the task (e.g., 256, 512, 1024)."
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Total memory (MiB) for the task (e.g., 512, 1024, 2048)."
  type        = number
  default     = 512
}

variable "execution_role_arn" {
  description = "IAM role that the ECS agent uses to pull images/send logs."
  type        = string
  default     = null
}

variable "task_role_arn" {
  description = "IAM role that your application containers assume."
  type        = string
  default     = null
}

variable "volume_name" {
  description = "(Optional) Volume name. If null, no volume block is created."
  type        = string
  default     = null
}

variable "volume_host_path" {
  description = "(Optional - EC2 only) Host path for bind mount volumes."
  type        = string
  default     = null
}

variable "docker_volume_configuration" {
  description = "(Optional - EC2) Docker volume configuration."
  type = object({
    autoprovision = optional(bool)
    driver        = optional(string)
    driver_opts   = optional(map(string))
    labels        = optional(map(string))
  })
  default = null
}

variable "efs_volume_configuration" {
  description = "(Optional) EFS volume configuration for Fargate/EC2."
  type = object({
    file_system_id          = string
    root_directory          = optional(string)
    transit_encryption      = optional(string) # ENABLED/DISABLED
    transit_encryption_port = optional(number)
    authorization_config    = optional(object({
      access_point_id = optional(string)
      iam             = optional(string) # ENABLED/DISABLED
    }))
  })
  default = null
}

variable "tags" {
  description = "Tags list."
  type        = map(string)
  default     = {}
}