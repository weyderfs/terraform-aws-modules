variable "name" {
  type          = string
  description   = "The name of Secrets to be stored"
}

variable "secret_id" {
  type          = string
  default       = null
  description   = "The Secrets ID to be stored"
}
