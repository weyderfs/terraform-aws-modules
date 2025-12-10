
variable "name" {
  description = "Name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "Controls image tag mutability: MUTABLE or IMMUTABLE."
  type        = string
  default     = "IMMUTABLE"
}

variable "force_delete" {
  description = "If true, forces deletion of the repository even if it contains images."
  type        = bool
  default     = false
}

variable "scan_on_push" {
  description = "Enable vulnerability scanning on image push."
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Encryption type: AES256 or KMS. If kms_key_arn is provided, set to KMS."
  type        = string
  default     = "AES256"
}

variable "kms_key_arn" {
  description = "Optional KMS key ARN for repository encryption (if null, ECR uses AES-256)."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the ECR repository."
  type        = map(string)
  default     = {}
}