variable "enabled" {
  type        = bool
  description = "Whether the distribution is enabled to accept end user requests for content."
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "Whether the IPv6 is enabled for the distribution."
}

variable "comment" {
  type        = string
  default     = null
  description = "Any comments you want to include about the distribution."
}

variable "price_class" {
  type        = string
  description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
}

variable "default_root_object" {
  type        = string
  default     = null
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
}

variable "aliases" {
  type        = list
  default     = []
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
}

variable "origin" {
  type        = list(object({ domain_name = any, origin_id = string, origin_http_port = number, origin_https_port = number, origin_protocol_policy = string, origin_ssl_protocols = list(string), origin_keepalive_timeout = number, origin_read_timeout = number }))
  description = "One or more origins for this distribution (multiples allowed)."
}

variable "default_cache_behavior" {
  type        = list(object({ allowed_methods = list(string), cached_methods = list(string), default_ttl = number, max_ttl = number, min_ttl = number, target_origin_id = any, viewer_protocol_policy = any, headers = list(string), query_string = bool, forward = string }))
  description = "The arguments for default_cache_behavior are the same as for ordered_cache_behavior, except for the path_pattern argument should not be specified."
}

variable "geo_restriction" {
  type        = list(object({ restriction_type = string, locations = list(string) }))
  description = "The restrictions sub-resource takes another single sub-resource named geo_restriction"
}

variable "viewer_certificate" {
  type        = list(object({ acm_certificate_arn = string, cloudfront_default_certificate = string, iam_certificate_id = string, minimum_protocol_version = string, ssl_support_method = string }))
  description = "(Required) - The SSL configuration for this distribution (maximum one)."
}
