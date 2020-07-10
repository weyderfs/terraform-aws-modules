  variable "name_vault" {
      type          = string
      default       = null
      description   = "The name of Vault"
  }

  variable "kms_key_arn" {
      type          = string
      default       = null
      description   = "KMS Key that will use to crypt the vault"
  }

  variable "recovery_points" {
      type      = string
      default   = null
      description   = "Number of recovery points stored"
  }