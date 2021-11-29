variable "certificate_id" {
    type        = string
    default     = ""
    description = "(Required) The certificate identifier."
}

variable "certificate_pem" {
    type        = string
    default     = ""
    description = "(Optional) The contents of the .pem X.509 certificate file for the certificate. Either certificate_pem or certificate_wallet must be set."
}

variable "certificate_wallet" {
    type        = string
    default     = ""
    description = "(Optional) The contents of the Oracle Wallet certificate for use with SSL, provided as a base64-encoded String. Either certificate_pem or certificate_wallet must be set."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "A map of tags to assign to the resource."
}
