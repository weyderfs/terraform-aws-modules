variable "vpc_id" {
  type        = string
  description = "(Optional, Forces new resource) VPC ID. Note that changing the vpc_id will not restore any default security group rules that were modified, added, or removed. It will be left in its current state."
}
variable "ingress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string,
    cidr_blocks = list(string)
  }))
  default     = []
  description = "Ingress Rules"
}

variable "ingress_sg" {
  type = list(object({
    description     = string,
    from_port       = number,
    to_port         = number,
    protocol        = string,
    security_groups = list(string)
  }))
  default     = []
  description = "Ingress Rules"
}

variable "egress" {
  type = list(object({
    description = string,
    from_port   = number,
    to_port     = number,
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = []
  description = "Egress Rules"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}