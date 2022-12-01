variable "domain_name" {
  type        = string
  description = "(Required) Domain name for which the certificate should be issued"
}
variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "(Required) Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The resource tag"
}