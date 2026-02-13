variable "event_categories" {
    type        = list(string)
    default     = []
    description = " (Optional) List of event categories to listen for, see DescribeEventCategories for a canonical list."
}

variable "name" {
    type        = string
    default     = ""
    description = "Name of event subscription."
}

variable "sns_topic_arn" {
    type        = string
    default     = ""
    description = "(Required) SNS topic arn to send events on."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "A map of tags to assign to the resource."
}

variable "enabled" {
    type        = bool
    default     = true
    description = "(Optional, Default: true) Whether the event subscription should be enabled"
}

variable "source_ids" {
    type        = list(string)
    default     = []
    description = "(Required) Ids of sources to listen to."
}
variable "source_type" {
    type        = string
    default     = "replication-task"
    description = "(Optional, Default: all events) Type of source for events. Valid values: replication-instance or replication-task"
}
