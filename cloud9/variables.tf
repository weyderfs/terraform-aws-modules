variable "instance_type" {
    type        = string
    default     = "t2.micro"
    description = "Type of EC2 chassi"

  }

variable "name" {
    type          = string
    default       = null
    description   = "Name of Cloud9 instance"

}

variable "automatic_stop_time_minutes" {
    type    = string
    default = null
    description = "(Optional) The number of minutes until the running instance is shut down after the environment has last been used."

}
  
variable "description" {
    type        = string
    default     = null
    description = "A short decription to environment"

}

variable "owner_arn" {
    type        = string
    default     = null
    description = "(Optional) The ARN of the environment owner. This can be ARN of any AWS IAM principal. Defaults to the environment's creator."

}

variable "subnet_id" {
    type    = string
    default = null
    description = "(Optional) The ID of the subnet in Amazon VPC that AWS Cloud9 will use to communicate with the Amazon EC2 instance."
}