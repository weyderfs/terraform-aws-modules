variable "name" {
    type        = string 
    default     = null
    description = "The name of the Role"
}
variable "assume_role_policy"   {
    type        = string
    description = "The policy permitions JSON AWS Syntax"
}
variable "description"   {
    type        = string 
    description = "The description of them"
}
variable "max_session_duration"   {
    type        = number
    default     = 1 
    description = "The duration of session"
}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags."
}