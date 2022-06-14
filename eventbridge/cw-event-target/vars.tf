variable "target_id" {
  type        = string
  description = "(Optional) The unique target assignment ID. If missing, will generate a random, unique id."
}
variable "rule" {
  type        = string
  description = "(Required) The name of the rule you want to add targets to."
}
variable "arn" {
  type        = string
  description = "(Required) The Amazon Resource Name (ARN) of the target."
}
variable "run_command_targets" {
  type        = string
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Documented below. A maximum of 5 are allowed."
}