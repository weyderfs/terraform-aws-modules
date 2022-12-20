variable "random_password_lenght" {
  type        = number
  default     = 16
  description = "The length of the string desired. The minimum value for length is 1 and, length must also be >= (min_upper + min_lower + min_numeric + min_special"
}

variable "random_password_special" {
  type        = bool
  default     = true
  description = "Include special characters in the result. These are !@#$%&*()-_=+[]{}<>:?"
}

variable "random_password_override_special" {
  type        = string
  default     = "_!%^"
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument. The special argument must still be set to true for any overwritten characters to be used in generation."
}

variable "aws_secretsmanager_secret_name" {
  type        = string
  description = "Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@-"
}

variable "aws_secretsmanager_secret_tags" {
  type        = map(string)
  default     = {}
  description = "The resource Tags"
}