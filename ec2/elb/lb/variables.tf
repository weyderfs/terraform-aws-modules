
variable "name" {
  description = "Load balancer name"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Load balancer type: application (ALB) or network (NLB)"
  type        = string
  default     = "application"

  validation {
    condition     = contains(["application", "network"], lower(var.load_balancer_type))
    error_message = "load_balancer_type must be 'application' or 'network'."
  }
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the ALB (ignored for NLB)"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer (public for internet-facing, private for internal)"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for the load balancer"
  type        = bool
  default     = true
}

variable "idle_timeout" {
  description = "Idle timeout in seconds (ALB only)"
  type        = number
  default     = 60
}

variable "tags" {
  description = "Tags to apply to load balancer resources"
  type        = map(string)
  default     = {}
}

variable "listeners" {
  description = "List of listener configurations. If empty, legacy HTTP/HTTPS inputs are used."
  type = list(object({
    name            = string
    port            = number
    protocol        = string
    ssl_policy      = optional(string)
    certificate_arn = optional(string)
    alpn_policy     = optional(string)
    default_action = object({
      type             = string
      target_group_arn = optional(string)
      redirect = optional(object({
        port        = string
        protocol    = string
        status_code = string
        host        = optional(string)
        path        = optional(string)
        query       = optional(string)
      }))
      fixed_response = optional(object({
        content_type = string
        message_body = optional(string)
        status_code  = string
      }))
    })
  }))
  default = []

  validation {
    condition = alltrue([
      for l in var.listeners : contains([
        "HTTP",
        "HTTPS",
        "TCP",
        "TLS",
        "UDP",
        "TCP_UDP",
        "GENEVE"
      ], upper(l.protocol))
    ])
    error_message = "listeners[*].protocol must be a valid load balancer protocol."
  }

  validation {
    condition = alltrue([
      for l in var.listeners : contains(["forward", "redirect", "fixed-response"], lower(l.default_action.type))
    ])
    error_message = "listeners[*].default_action.type must be forward, redirect, or fixed-response."
  }

  validation {
    condition = alltrue([
      for l in var.listeners : lower(l.default_action.type) != "forward" || try(l.default_action.target_group_arn != null, false)
    ])
    error_message = "When listeners[*].default_action.type is 'forward', target_group_arn must be set."
  }
}


