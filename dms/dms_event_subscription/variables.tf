variable "name" {
    type        = string
    default     = ""
    description = "(Required) Name of event subscription."
}

variable "enabled" {
    type        = bool
    default     = true
    description = "(Optional, Default: true) Whether the event subscription should be enabled."
}

variable "event_categories" {
    type    = list(string)
    default = []
    description = "(Optional) List of event categories to listen for, see DescribeEventCategories for a canonical list."
}

variable "source_type" {
    type        = string    
    description = "(Optional, Default: all events) Type of source for events. Valid values: replication-instance or replication-task"
}

variable "source_ids" {
    type        = list(string)
    default     = []
    description = "(Required) Ids of sources to listen to."
}

variable "sns_topic_arn" {
    type        = string
    default     = ""
    description = "(Required) SNS topic arn to send events on."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "(Optional) Map of resource tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
