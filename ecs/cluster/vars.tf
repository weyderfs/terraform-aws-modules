variable "ecscluster_name" {
    type            = string
    default         = ""
    description     = "(Required) The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "default_capacity_provider_strategy" {
    type            = list(string)
    default         = []
    description     = "(Optional) The capacity provider strategy to use by default for the cluster. Can be one or more."
}

variable "setting_name" {
    type        = string
    default     = "containerInsights"
    description = "(Required) Name of the setting to manage. Valid values: containerInsights."

}

variable "container_insights" {
    type        = string
    default     = "enabled"
    description = "(Required) The value to assign to the setting. Value values are enabled and disabled"
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags to add to ECS Cluster"
}