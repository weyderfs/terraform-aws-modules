
variable "name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "enable_container_insights" {
  description = "Enable Container Insights on the cluster"
  type        = bool
  default     = false
}

variable "container_insights_level" {
  description = "Level of Container Insights (disabled, enabled, enhanced)"
  type        = string
  default     = "disabled"
  
  validation {
    condition     = contains(["disabled", "enabled", "enhanced"], var.container_insights_level)
    error_message = "Must be one of: disabled, enabled, enhanced"
  }
}

# Ex.: ["FARGATE", "FARGATE_SPOT"]
variable "capacity_providers" {
  description = "List of capacity providers associated with the cluster."
  type        = list(string)
  default     = []
}

# Ex.: [{ capacity_provider = "FARGATE", weight = 1 }]
variable "default_capacity_provider_strategy" {
  description = "Default cluster strategy (list of maps)"
  type = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default = []
}

variable "cluster_configuration" {
  description = "Configuration of the execute command and cluster logs."
  type = object({
    execute_command_configuration = optional(object({
      kms_key_id       = optional(string)
      logging          = optional(string)
      log_configuration = optional(object({
        cloud_watch_log_group_name     = optional(string)
        cloud_watch_encryption_enabled = optional(bool)
      }))
    }))
  })
  default = null
}

# Optional - set if you want Service Connect to be the default
variable "service_connect_defaults" {
  description = "Namespace default for Service Connect"
  type = object({
    namespace = string
  })
  default = null
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}
