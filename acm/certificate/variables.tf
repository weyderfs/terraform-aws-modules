variable "domain_name" {
  type        = string
  description = "(Required) Domain name for which the certificate should be issued"
}

variable "subject_alternative_names" {
  type        = list(string)
  default     = []
  description = "Optional set of domains that should be SANs in the certificate"
}

variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "(Required) Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  validation {
    condition     = contains(["DNS", "EMAIL", "NONE"], var.validation_method)
    error_message = "validation_method must be one of: DNS, EMAIL, NONE."
  }
}

variable "validation_options" {
  type = list(object({
    domain_name       = string
    validation_domain = string
  }))
  default     = []
  description = "Optional validation options for EMAIL validation"
}

variable "options" {
  type = object({
    certificate_transparency_logging_preference = string
  })
  default     = null
  description = "Optional ACM options (e.g., certificate transparency logging preference)"
}

variable "certificate_authority_arn" {
  type        = string
  default     = null
  description = "Optional ARN of the ACM PCA to issue the certificate"
}

variable "key_algorithm" {
  type        = string
  default     = null
  description = "Optional key algorithm for the certificate"
}

variable "certificate_body" {
  type        = string
  default     = null
  description = "Optional certificate body when importing a certificate"
  sensitive   = true
}

variable "private_key" {
  type        = string
  default     = null
  description = "Optional private key when importing a certificate"
  sensitive   = true
}

variable "certificate_chain" {
  type        = string
  default     = null
  description = "Optional certificate chain when importing a certificate"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The resource tag"
}