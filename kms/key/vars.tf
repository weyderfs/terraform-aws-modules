variable "description" {
  type        = string
  default     = null
  description = "(Optional) The description of the key as viewed in AWS console."
}
variable "deletion_window_in_days" {
  type        = string
  description = "(Optional) Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
}
variable "key_usage" {
  type        = string
  default     = null
  description = "(Optional) Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT."
}
variable "customer_master_key_spec" {
  type        = string
  default     = null
  description = "(Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT"
}
variable "is_enabled" {
  type        = string
  default     = null
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
}
variable "enable_key_rotation" {
  type        = string
  default     = null
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags"
}

variable "name" {
  type        = string
  description = "KMS Alias name"
}

variable "policy" {
  type        = string
  default     = ""
  description = "Policy used by KMS"
}

variable "multi_region" {
  type        = bool
  default     = false
  description = "(Optional) Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
}
