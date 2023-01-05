variable "statement" {
  type        = list(object({ actions = list(string), effect = list(string), resources = list(string), sid = string }))
  description = "(Required) - Statement definitions."
}
