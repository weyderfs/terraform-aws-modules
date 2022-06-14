variable "endpoint_config_name" {
  type        = string
  description = "(Required) The name of the endpoint configuration to use."
}

variable "deployment_config" {
  type        = object({
    blue_green_update_policy = object({
      traffic_routing_configuration            = object({
        type             = string, wait_interval_in_seconds = number,
        canary_size      = object({ type = string, value = string }),
        linear_step_size = object({ type = string, value = number })
      }), maximum_execution_timeout_in_seconds = number,
      termination_wait_in_seconds              = number
    })
    auto_rollback_configuration = object({alarms = list(string)})
  })

  description = "(Optional) The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
}

variable "name" {
  type        = string
  description = "(Optional) The name of the endpoint. If omitted, Terraform will assign a random, unique name."
}

variable "tags" {
  type    = map(string)
  default = {}
}

