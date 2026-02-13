variable "name" {
    type        = string
    description = "(Optional) The name of the launch configuration. If you leave this blank, Terraform will auto-generate a unique name."
}

variable "image_id" {
    type = string
    description = "(Required) The EC2 image ID to launch."

    validation {
      condition = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
      error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
}

variable "instance_type" {
    type = string
    description = "(Required) The size of instance to launch."
}

variable "security_groups"  {
    type        = list(string)
    default     = [] 
    description = "(Optional) A list of associated security group IDS."

    validation {
      condition = can([for s in var.security_groups : regex("^sg-", s)])
      error_message = "The Security Groups need starts to \"sg-\"."
    }
}

variable "iam_instance_profile" {
    type = string
    default = null
    description = "(Optional) The name attribute of the IAM instance profile to associate with launched instances."
}

variable "user_data" {
    type    = string
    default = null
    description = "(Optional) The user data to provide when launching the instance. "

}
