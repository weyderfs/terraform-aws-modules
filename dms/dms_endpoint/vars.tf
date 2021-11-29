# Default
variable "endpoint_type" {
    type        = string
    default     = ""
    description = "(Required) The type of endpoint. Can be one of source | target."
}

variable "endpoint_id" {
    type        = string
    default     = ""
    description = "(Required) The endpoint identifier."
}

variable "engine_name" {
    type        = string
    default     = ""
    description = "(Required) The type of engine for the endpoint. Can be one of aurora | aurora-postgresql| azuredb | db2 | docdb | dynamodb | elasticsearch | kafka | kinesis | mariadb | mongodb | mysql | oracle | postgres | redshift | s3 | sqlserver | sybase."
}

variable "extra_connection_attributes" {
    type        = string
    default     = ""
    description = "Additional attributes associated with the connection."
}

variable "tags" {
    type    = map(string)
    default = {}
    description = "A map of tags to assign to the resource."
}

# Database
variable "server_name" {
    type        = string
    default     = ""
    description = "(Optional) The host name of the server."
}

variable "port" {
    type        = number
    default     = 0
    description = "(Optional) The port used by the endpoint database."
}

variable "username" {
    type        = string
    default     = ""
    description = "(Optional) The user name to be used to login to the endpoint database."
}

variable "password" {
    type        = string
    default     = ""
    description = "(Optional) The password to be used to login to the endpoint database."
}

variable "ssl_mode" {
    type        = string
    default     = "none"
    description = "(Optional, Default: none) The SSL mode to use for the connection. Can be one of none | require | verify-ca | verify-full"
}

# S3
variable "s3_settings" {
    type        = list(map(string))
    default     = []
    description = "(Optional) Settings for the target S3 endpoint. Available settings are service_access_role_arn, external_table_definition, csv_row_delimiter (default: \\n), csv_delimiter (default: ,), bucket_folder, bucket_name and compression_type (default: NONE)."
}
