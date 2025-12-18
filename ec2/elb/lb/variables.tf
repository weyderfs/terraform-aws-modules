
variable "name" {
  description = "ALB name"
  type        = string
}

variable "internal" {
  description = "Whether ALB is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Load balancer type (must be 'application' for ALB)"
  type        = string
  default     = "application"

  validation {
    condition     = lower(var.load_balancer_type) == "application"
    error_message = "Only 'application' is supported in this module."
  }
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB (public for internet-facing, private for internal)"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
  default     = true
}

variable "idle_timeout" {
  description = "Idle timeout in seconds"
  type        = number
  default     = 60
}

variable "tags" {
  description = "Tags to apply to ALB resources"
  type        = map(string)
  default     = {}
}

# --- HTTP listener settings (port 80) ---
variable "enable_http" {
  description = "Enable HTTP listener"
  type        = bool
  default     = true
}

variable "http_port" {
  description = "HTTP listener port"
  type        = number
  default     = 80
}

variable "http_protocol" {
  description = "HTTP listener protocol"
  type        = string
  default     = "HTTP"

  validation {
    condition     = upper(var.http_protocol) == "HTTP"
    error_message = "http_protocol must be 'HTTP'."
  }
}

variable "http_default_action_type" {
  description = "Default action type for HTTP listener"
  type        = string
  default     = "forward"

  validation {
    condition     = contains(["forward", "redirect", "fixed-response"], lower(var.http_default_action_type))
    error_message = "http_default_action_type must be one of: forward, redirect, fixed-response."
  }
}

variable "http_target_group_arn" {
  description = "Target group ARN for HTTP listener default action"
  type        = string
  default     = null
}

# --- HTTPS listener settings (port 443) ---
variable "enable_https" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = false
}

variable "https_port" {
  description = "HTTPS listener port"
  type        = number
  default     = 443
}

variable "https_protocol" {
  description = "HTTPS listener protocol"
  type        = string
  default     = "HTTPS"

  validation {
    condition     = upper(var.https_protocol) == "HTTPS"
    error_message = "https_protocol must be 'HTTPS'."
  }
}

variable "ssl_policy" {
  description = "SSL policy for the HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS listener"
  type        = string
  default     = null
}

variable "https_default_action_type" {
  description = "Default action type for HTTPS listener"
  type        = string
  default     = "forward"

  validation {
    condition     = contains(["forward", "redirect", "fixed-response"], lower(var.https_default_action_type))
    error_message = "https_default_action_type must be one of: forward, redirect, fixed-response."
  }
}

variable "https_target_group_arn" {
  description = "Target group ARN for HTTPS listener default action"
  type        = string
  default     = null
}
