variable "domain_name" {
  type        = string
  description = "(Required) - The DNS domain name of either the S3 bucket, or web site of your custom origin."
}

variable "origin_access_control_id" {
  type        = string
  default     = null
  description = "(Optional) - The unique identifier of a CloudFront origin access control for this origin."
}

variable "origin_id" {
  type        = string
  description = "(Required) - A unique identifier for the origin."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "(Required) - Whether the distribution is enabled to accept end user requests for content."
}

variable "is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "(Optional) - Whether the IPv6 is enabled for the distribution."
}

variable "description" {
  type        = string
  description = "(Optional) - Any descriptions you want to include about the distribution."
}

variable "default_root_object" {
  type        = string
  default     = "index.html"
  description = "(Optional) - The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
}

variable "logging_config_include_cookies" {
  type        = bool
  default     = false
  description = "(Optional) - Specifies whether you want CloudFront to include cookies in access logs."
}

variable "logging_config_bucket" {
  type        = string
  description = "(Required) - The Amazon S3 bucket to store the access logs in"
}

variable "logging_config_prefix" {
  type        = string
  description = "(Optional) - An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
}

variable "aliases" {
  type        = string
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
}

variable "default_cache_behavior_allowed_methods" {
  type        = string
  description = "(Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
}

variable "default_cache_behavior_cached_methods" {
  type        = string
  description = "(Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "default_cache_behavior_target_origin_id" {
  type        = string
  description = "(Required) - The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
}

variable "default_cache_behavior_forwarded_values_query_string" {
  type        = string
  description = "(Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
}

variable "default_cache_behavior_forwarded_values_cookies_foward" {
  type        = string
  default     = "all"
  description = "(Required) - Whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
}

variable "default_cache_behavior_viewer_protocol_policy" {
  type        = string
  default     = "redirect-to-https"
  description = "(Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
}

variable "default_cache_behavior_min_ttl" {
  type        = number
  default     = 0
  description = "(Optional) - The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds."
}

variable "default_cache_behavior_default_ttl" {
  type        = string
  default     = 3600
  description = "(Optional) - The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
}

variable "default_cache_behavior_max_ttl" {
  type        = number
  default     = 86400
  description = "(Optional) - The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers."
}

variable "ordered_cache_behavior_path_pattern" {
  type        = string
  description = "(Required) - The pattern (for example, images/*.jpg) that specifies which requests you want this cache behavior to apply to."
}

variable "ordered_cache_behavior_path_allowed_methods" {
  type        = string
  description = "(Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
}

variable "ordered_cache_behavior_path_cached_methods" {
  type        = string
  description = "(Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "ordered_cache_behavior_path_target_origin_id" {
  type        = string
  description = "(Required) - The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
}

variable "ordered_cache_behavior_forwarded_values_query_string" {
  type        = string
  description = "(Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
}

variable "ordered_cache_behavior_forwarded_values_headers" {
  type        = string
  default     = "*"
  description = "(Optional) - Headers, if any, that you want CloudFront to vary upon for this cache behavior. Specify * to include all headers."
}

variable "ordered_cache_behavior_forwarded_values_cookies_forward" {
  type        = string
  default     = "all"
  description = "(Required) - Whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
}

variable "ordered_cache_behavior_min_ttl" {
  type        = number
  default     = 0
  description = "(Optional) - The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds."
}

variable "ordered_cache_behavior_default_ttl" {
  type        = number
  default     = 3600
  description = "(Optional) - The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
}

variable "ordered_cache_behavior_max_ttl" {
  type        = number
  default     = 86400
  description = "(Optional) - The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers."
}

variable "ordered_cache_behavior_compress" {
  type        = bool
  default     = false
  description = "(Optional) - Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header."
}

variable "ordered_cache_behavior_viewer_protocol_policy" {
  type        = string
  default     = "redirect-to-https"
  description = "(Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
}

variable "price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
}

variable "restrictions_geo_restriction_restriction_type" {
  type        = string
  default     = "none"
  description = "(Required) - The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
}

variable "restrictions_geo_restriction_locations" {
  type        = string
  description = "(Optional) - The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The list of resource tags"
}

variable "viewer_certificate_cloudfront_default_certificate" {
  type        = bool
  default     = false
  description = "true if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution. Specify this, acm_certificate_arn, or iam_certificate_id."
}
