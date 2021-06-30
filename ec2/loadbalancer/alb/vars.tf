variable "name" {
    type        = string
    default     = null
    description = "The name of Loadbalancer"
}

variable "ip_address_type" {
    type        = string
    default     = "ipv4"
    description = "(Optional) The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack" 
}

variable "idle_timeout" {
    type    = number
    default = 60
    description = "(Optional) The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60."
  
}

variable "internal" {
    type        = bool
    default     = true
    description = "(Optional) If true, the LB will be internal."
}

variable "security_groups" {
    type        = list(string)
    description = "(Optional) A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application"
}

variable "subnets" {
    type        = list(string)
    default     = []
    description = "(Optional) A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value for load balancers of type network will force a recreation of the resource."
}

variable "enable_deletion_protection" {
    type        = bool
    default     = true
    description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "List of resource tags"
}

variable  "port" {
    type = string
    default = null
    description = "(Optional) Port on which the load balancer is listening. Not valid for Gateway Load Balancers. "
}
variable  "protocol" {
    type = string
    default = null
    description = "(Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP"
}
variable  "ssl_policy" {
    type = string
    default = null
    description = "(Optional) Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
}
variable  "certificate_arn" {
    type = string
    default = null
    description = "(Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
}
variable  "default_action_type" {
    type = string
    default = "redirect"
    description = "(Required) Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc. "
}
variable  "port_redirect" {
    type = string
    default = null
    description = "(Optional) Port. Specify a value from 1 to 65535 or #{port} "
}
variable  "protocol_redirect" {
    type = string
    default = null
    description = " (Optional) Protocol. Valid values are HTTP, HTTPS, or #{protocol}."
}
variable  "status_code" {
    type = string
    default = "HTTP_301"
    description = "(Required) HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302)"
}
variable  "path" {
    type = string
    default = "/#{path}"
    description = "Optional) Absolute path, starting with the leading '/'. This component is not percent-encoded. The path can contain #{host}, #{path}, and #{port}. Defaults to /#{path}."
}
variable  "query" {
    type = string
    default = "/#{query}"
    description = " (Optional) Query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading '?'. Defaults to #{query}."
}

variable "host" {
    type = string
    default = "#{host}"
    description = " (Optional) Query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading '?'. Defaults to #{query}."
}

variable "listeners" {
    type = list
}