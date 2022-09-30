variable "domain_name" {
   type        = string
   description = "(Required) Name of the domain."
}
variable "engine_version" {
   type        = string
   default     = "Elasticsearch_7.10"
   description = "(Optional) Either Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine version for the Amazon OpenSearch Service domain. For example, OpenSearch_1.0 or Elasticsearch_7.9."
}
variable "instance_type" {
   type        = string
   default     = "t2.micro.elasticsearch"
   description = "argument values end in search for OpenSearch vs. elasticsearch for Elasticsearch (e.g., t2.micro.search vs. t2.micro.elasticsearch"
}
variable "tags" {
   type        = map(string)
   default     = {}
   description = "List of Resource Tags"
}

variable "advanced_security_enabled" {
   type        = bool
   default     = false
   description = "(Required, Forces new resource when changing from true to false) Whether advanced security is enabled."
}
variable "advanced_security_enabled_anonymous_auth_enabled" {
   type        = bool
   default     = false
   description = "(Optional) Whether Anonymous auth is enabled. Enables fine-grained access control on an existing domain. Ignored unless advanced_security_options are enabled. Can only be enabled on an existing domain."
}
variable "advanced_security_internal_user_database_enabled" {
   type        = bool
   default     = false
   description = "(Optional) Whether the internal user database is enabled. Default is false."
}
variable "master_user_name" {
   type        = string
   default     = "adminkibana"
   description = "(Optional) Main user's username, which is stored in the Amazon OpenSearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true"
}
variable "master_user_password" {
   type        = string
   default     =
   sensitive   = true 
   description = "(Optional) Main user's password, which is stored in the Amazon OpenSearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true."
}
variable "encrypt_at_rest_enabled" {
   type        = 
   default     =
   description = 
}
variable "domain_endpoint_enforce_https" {
   type        = 
   default     =
   description = 
}
variable "domain_endpoint_tls_security_policy" {
   type        = 
   default     =
   description = 
}
variable "node_to_node_encryption_enabled" {
   type        = 
   default     =
   description = 
}
variable "ebs_enabled" {
   type        = 
   default     =
   description = 
}
variable "volume_size" {
   type        = 
   default     =
   description = 
}