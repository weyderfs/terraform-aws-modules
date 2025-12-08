
variable "name" {
  description = "Nome do ECS Cluster"
  type        = string
}

variable "enable_container_insights" {
  description = "Habilita Container Insights no cluster"
  type        = bool
  default     = false
}

# Ex.: ["FARGATE", "FARGATE_SPOT"]
variable "capacity_providers" {
  description = "Lista de capacity providers associados ao cluster"
  type        = list(string)
  default     = []
}

# Ex.: [{ capacity_provider = "FARGATE", weight = 1 }]
variable "default_capacity_provider_strategy" {
  description = "Estratégia default do cluster (lista de maps)"
  type = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default = []
}

variable "cluster_configuration" {
  description = "Configuration of the 'execute command' and cluster logs."
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

# Optional — set if you want Service Connect to be the default
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
