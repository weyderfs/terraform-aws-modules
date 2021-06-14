variable "bucket" {
  type        = string
  description = "buckt s3 name"
}

variable "acl" {
  type        = string
  description = "private"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "allowed_headers" {
  type        = list(any)
  default     = null
  description = "(Optional) Specifies which headers are allowed."
}


variable "allowed_methods" {
  type        = list(any)
  default     = null
  description = "(Required) Specifies which methods are allowed. Can be GET, PUT, POST, DELETE or HEAD"
}

variable "policy" {
  description = "policy - (Optional) A valid bucket policy JSON document."
}

variable "allowed_origins" {
  type        = list(any)
  default     = null
  description = "(Required) Specifies which origins are allowed"
}



variable "expose_headers" {
  type        = list(any)
  default     = null
  description = "(Optional) Specifies expose header in the response."
}
