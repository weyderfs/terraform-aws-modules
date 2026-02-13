variable "replication_task_id" {
    type        = string
    default     = ""
    description = "(Required) The replication task identifier."
}

variable "replication_instance_arn" {
    type        = string
    default     = ""
    description = "Required) The Amazon Resource Name (ARN) of the replication instance."
}

variable "source_endpoint_arn" {
    type        = string
    default     = ""
    description = "(Required) The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint."
}

variable "target_endpoint_arn" {
    type        = string
    default     = ""
    description = "(Required) The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint."
}

variable "migration_type" {
    type        = string
    default     = ""
    description = "(Required) The migration type. Can be one of full-load | cdc | full-load-and-cdc."
}

variable "replication_task_settings" {
    description = "(Optional) An escaped JSON string that contains the task settings."
}

variable "table_mappings" {
    description = "(Required) An escaped JSON string that contains the table mappings."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "A map of tags to assign to the resource."
}
