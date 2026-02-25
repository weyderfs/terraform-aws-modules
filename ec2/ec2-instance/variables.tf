variable "name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID to use for the instance. If null, ami_filters will be used"
  type        = string
  default     = null
}

variable "ami_filters" {
  description = "Filters to select AMI. Used only if ami is null"
  type = object({
    owners = list(string)
    filters = list(object({
      name   = string
      values = list(any)
    }))
  })
  default = null
}

variable "vpc_id" {
  description = "VPC ID where the instance will be created"
  type        = string
}

variable "subnet_id" {
  description = "List of subnet IDs where the instance can be created"
  type        = list(string)
}

variable "allow_ssh_from_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into the instance"
  type        = list(string)
  default     = []
}

variable "allow_ssh_from_security_group_ids" {
  description = "List of security group IDs allowed to SSH into the instance"
  type        = list(string)
  default     = []
}

variable "allow_port_from_cidr_blocks" {
  description = "Map of port rules from CIDR blocks"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {}
}

variable "allow_port_from_security_group_ids" {
  description = "Map of port rules from security group IDs"
  type = map(object({
    from_port            = number
    to_port              = number
    protocol             = string
    security_group_ids   = list(string)
  }))
  default = {}
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID for DNS record"
  type        = string
  default     = ""
}

variable "route53_lookup_domain_name" {
  description = "Domain name for Route53 lookup"
  type        = string
  default     = ""
}

variable "dns_zone_is_private" {
  description = "Whether the Route53 zone is private"
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 30
}

variable "ebs_volumes" {
  description = "Map of additional EBS volumes to attach"
  type = map(object({
    device_name = string
    size        = number
    type        = string
    encrypted   = optional(bool, true)
    iops        = optional(number)
    throughput  = optional(number)
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
