variable "role_name" {
    type        = string
    default     = null
    description = "(Required) The display name of role. "
}
variable "policy_role" {
    type        = string
    default     = null
    description = "The police AWS Backup default"
}
variable "selection_by_tag_iam_role_arn" {
    type        = string
    default     = null
    description = "(Required) The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. See the AWS Backup Developer Guide for additional information about using AWS managed policies or creating custom policies attached to the IAM role."
}
variable "selection_by_tag_name" {
    type        = string
    default     = null
    description = "(Required) The display name of a resource selection document."
}
variable "selection_by_tag_plan_id" {
    type        = string
    default     = null
    description = "(Required) The backup plan ID to be associated with the selection of resources."
}
variable "selection_tag_key_label" {
    type        = string
    default     = null
    description = "The label of the TAG"
}
variable "selection_tag_value" {
    type        = string
    default     = null
    description = "The value related with TAG Label"
}
variable "selection_by_resource_name" {
    type        = string
    default     = null
    description = "(Required) The display name of a resource selection document."
}
variable "selection_by_resource_iam_role_arn  " {
    type        = string
    default     = null
    description = "(Required) The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource. See the AWS Backup Developer Guide for additional information about using AWS managed policies or creating custom policies attached to the IAM role."
}
variable "selection_by_resource_plan_id" {
    type        = string
    default     = null
    description = "(Required) The backup plan ID to be associated with the selection of resources."
}
variable "selection_by_resource_list_resources" {
    type        = list(string)
    default     = null
    description = "The list of recources that will be create backup"
}