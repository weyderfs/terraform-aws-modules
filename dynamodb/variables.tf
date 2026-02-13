variable "dynamodb_name" {
  type        = string
  default     = null
  description = "The name of the table, this needs to be unique within a region."
}

variable "billing_mode" {
  type        = string
  default     = "PROVISIONED"
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
}

variable "read_capacity"  {
  type        = number
  default     = 0
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
}

variable "write_capacity" {
  type        = number
  default     = 0
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
}

variable "hash_key" {
  type        = string
  default     = null
  description = "(Forces new resource) The attribute to use as the hash (partition) key."
}

variable "point_in_time_recovery" {
  type        = bool
  default     = false
  description = "(Optional) Point-in-time recovery options."
}

variable "range_key"  {
  type        = string
  default     = null
  description = "(Forces new resource) The attribute to use as the range (sort) key."
}

variable "attributes" {
  type        = list(map(string))
  default     = []
  description = "The list of the attributes."
}

variable "stream_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
}

variable "stream_view_type" {
  type        = string
  default     = null
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
}

variable "server_side_encryption_enabled" {
  type        = bool
  default     = false
  description = "(Required) Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)."
}

variable "server_side_encryption_kms_key_arn" {
  type        = string
  default     = ""
  description = "(Optional) The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb"
}

variable "local_secondary_indexes"  {
  type        = any
  default     = []
  description = "(Optional, Forces new resource) Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource."
}

variable "global_secondary_indexes" {
  type        = any
  default     = []
  description = "(Optional) Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc."
}

variable "ttl" {
  type        = any
  default     = []
  description = "(Optional) Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc."
}

variable "tags" {
  type    = map(string)
  default = {}
  description = "The list of resource tags"
}

