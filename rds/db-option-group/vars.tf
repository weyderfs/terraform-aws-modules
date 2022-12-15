variable "name" {
    type        = string
    description = "The name of RDS Option Group"
}
variable "option_group_description" {
    type        = string
    default     = null
    description = "The description, pourpose of the option group"
}
variable "engine_name" {
    type        = string
    description = "The family database engine"

}
variable "major_engine_version" {
    type        = number
    description = "The version of the database"

}
variable "tags" {
    type        = map(string)
    default     = {}
    description = "The list of Tags"
}