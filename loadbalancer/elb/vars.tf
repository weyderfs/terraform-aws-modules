variable "elb_name" {
    type        = string
    default     = null 
    description = "(Optional) The name of the ELB. By default generated by Terraform."
}

variable "elb_availability_zones"   {
    type        = list(string)
    default     = []
    description = "(Required for an EC2-classic ELB) The AZ's to serve traffic in."
}

variable "elb_instances"    {
    type        = list(string)
    default     = []
    description = "(Optional) A list of instance ids to place in the ELB pool."
}

variable "elb_cross_zone_lb"    {
    type        = bool
    default     = true
    description = "(Optional) Enable cross-zone load balancing."
}

variable "elb_idle_timeout" {
    type        = number
    default     = 60
    description = "(Optional) The time in seconds that the connection is allowed to be idle. Default: 60"
}

variable "elb_connection_draining"  {
    type        = bool
    default     = false
    description = "(Optional) Boolean to enable connection draining. Default: false"
}

variable "elb_connection_draining_timeout"  {
    type        = number
    default     = 300
    description = "(Optional) The time in seconds to allow for connections to drain. Default: 300"
}

variable "access_logs_bucket"   {
    type        = string
    description = "(Required) The S3 bucket name to store the logs in."
}

variable "access_logs_bucket_prefix"    {
    type        = string
    default     = null
    description = "(Optional) The S3 bucket prefix. Logs are stored in the root if not configured."
}

variable "access_logs_interval" {
    type        = number
    default     = 60
    description = "(Optional) The publishing interval in minutes. Default: 60 minutes."
}

variable "elb_listener" {
    type        = list(object({ lb_instance_port=number, lb_instance_protocol=string, lb_protocol=string, lb_port=number, lb_instance_protocol=string, lb_ssl_certificate_id=string }))
    description = "(Required) A list of listener blocks."
}   

variable "healthy_threshold"    {
    type        = number
    description = "(Required) The number of checks before the instance is declared healthy."
}

variable "unhealthy_threshold"  {
    type        = number
    description = "(Required) The number of checks before the instance is declared unhealthy."
}

variable "health_check_timeout" {
    type        = number
    description = "(Required) The length of time before the check times out."
}

variable "health_check_target"  {
    type        = string
    description = "(Required) The target of the check."
}

variable "health_check_interval" {
    type        = number
    description = "(Required) The interval between checks."
}
