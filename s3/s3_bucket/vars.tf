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

variable "days" {
  default     = null
  description = "(Optional) Number of days before the object is to be deleted."
}

variable "enabled" {
  type    = bool
  default = false

}

variable "prefix" {
  type        = string
  default     = null
  description = "(Optional) Object prefix for rule filtering."
}

variable "id" {
  type        = string
  default     = null
  description = "(Required) Unique identifier for the rule."
}

variable "sse_algorithm" {
  type        = string
  default     = "aws:kms"
  description = "(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}

variable "kms_master_key_id" {
  type    = string
  default = null
}

variable "policy" {
  type        = string
  default     = ""
  description = "policy - (Optional) A valid bucket policy JSON document."
}

