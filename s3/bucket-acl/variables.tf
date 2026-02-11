variable "bucket" {
  type        = string
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Whether to allow deleting non-empty buckets."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The resource Tags"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "(Optional, Conflicts with access_control_policy) The canned ACL to apply to the bucket."
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable bucket versioning."
}

variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Whether to block public ACLs."
}

variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Whether to block public bucket policies."
}

variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Whether to ignore public ACLs."
}

variable "restrict_public_buckets" {
  type        = bool
  default     = true
  description = "Whether to restrict public bucket policies."
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "Server-side encryption algorithm (AES256 or aws:kms)."

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be either AES256 or aws:kms."
  }
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "KMS key ARN or ID for aws:kms encryption."
}

variable "bucket_key_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable bucket key for SSE-KMS."
}

variable "enforce_tls" {
  type        = bool
  default     = true
  description = "Whether to deny non-TLS requests via bucket policy."
}

variable "enforce_sse" {
  type        = bool
  default     = true
  description = "Whether to deny uploads without the expected SSE header via bucket policy."
}

variable "policy" {
  type        = string
  default     = null
  description = "Additional bucket policy JSON to merge with baseline policy."
}

variable "logging_target_bucket" {
  type        = string
  default     = null
  description = "Target bucket for access logs."
}

variable "logging_target_prefix" {
  type        = string
  default     = null
  description = "Prefix for access logs in the target bucket."
}

variable "enable_lifecycle_rules" {
  type        = bool
  default     = true
  description = "Whether to enable lifecycle rules."
}

variable "enable_abort_incomplete_multipart_upload" {
  type        = bool
  default     = true
  description = "Whether to abort incomplete multipart uploads."
}

variable "abort_incomplete_multipart_upload_days" {
  type        = number
  default     = 7
  description = "Days to wait before aborting incomplete multipart uploads."

  validation {
    condition     = var.abort_incomplete_multipart_upload_days >= 1
    error_message = "abort_incomplete_multipart_upload_days must be at least 1."
  }
}