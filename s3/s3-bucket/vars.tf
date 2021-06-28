variable "bucket" {
  type        = string
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be less than or equal to 63 characters in length."
}

variable "acl" {
  type        = string
  default     = "private"
  description = "(Optional) The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
}

variable "versioning" {
  type        = map(string)
  default     = {}
  description = "Map containing versioning configuration"
}

variable "lifecycle_rule" {
  type        = any
  default     = []
  description = "List of maps containing configuration of object lifecycle management."
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "policy" {
  type        = string
  default     = null
  description = "policy - (Optional) A valid bucket policy JSON document."
}
