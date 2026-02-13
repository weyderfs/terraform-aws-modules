variable  "certificate_arn" {
    type = string
    default = null
    description = "(Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
}

variable  "listener_arn" {
    type = string
    default = null
    description = "(Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
}