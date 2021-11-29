variable "name" {
    type        = string 
    default     = null
    description = "The name of the Role"
}

variable "assume_role_policy"   {
    type        = string
    default     = <<-EOT
                    {
                        "Version": "2012-10-17",
                        "Statement": [
                            {
                            "Effect": "Allow",
                            "Principal": {
                                "Service": "ec2.amazonaws.com"
                            },
                            "Action": "sts:AssumeRole"
                            }
                        ]
                    }
EOT

    description = "The policy permitions JSON AWS Syntax"

}
variable "description"   {
    type        = string 
    default     = ""
    description = "The description of them"
}

variable "max_session_duration"   {
    type        = number
    default     = 1 
    description = "The duration of session"
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "A map of tags."
}

variable "policies" {
    type        = set(string)
    default     = []
    description = "The policies that should be attached to the role."
}
