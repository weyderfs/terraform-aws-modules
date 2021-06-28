variable "bucket" {
    type        = string
    description = "(Required) The name of the bucket to put notification configuration."
}

variable "block_public_acls" {
    type        = bool
    default     = false
    description = "(Optional) Whether Amazon S3 should block public ACLs for this bucket."
}

variable "block_public_policy" {
    type        = bool
    default     = false
    description = "(Optional) Whether Amazon S3 should block public bucket policies for this bucket."
}

variable "ignore_public_acls" {
    type        = bool
    default     = false
    description = "(Optional) Whether Amazon S3 should ignore public ACLs for this bucket."
}

variable "restrict_public_buckets" {
    type        = bool
    default     = false
    description = "(Optional) Whether Amazon S3 should restrict public bucket policies for this bucket. "
}