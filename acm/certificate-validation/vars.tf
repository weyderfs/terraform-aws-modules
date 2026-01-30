variable "certificate_arn" {
  type        = string
  description = "(Required) ACM certificate ARN to validate"
}

variable "validation_record_fqdns" {
  type        = list(string)
  default     = []
  description = "Optional list of FQDNs that implement the validation"
}
