variable "origins" {
  type = list(object({
    domain_name              = string
    origin_id                = string
    origin_access_control_id = optional(string)
    origin_path              = optional(string, "")
    custom_headers = optional(list(object({
      name  = string
      value = string
    })), [])
    custom_origin_config = optional(object({
      http_port              = optional(number, 80)
      https_port             = optional(number, 443)
      origin_protocol_policy = string
      origin_ssl_protocols   = list(string)
    }))
  }))
  description = "(Required) - List of origins for the CloudFront distribution."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "(Optional) - Whether the distribution is enabled to accept end user requests for content."
}

variable "is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "(Optional) - Whether IPv6 is enabled for the distribution."
}

variable "comment" {
  type        = string
  default     = ""
  description = "(Optional) - Any comments you want to include about the distribution."
}

variable "default_root_object" {
  type        = string
  default     = "index.html"
  description = "(Optional) - The object that you want CloudFront to return when an end user requests the root URL."
}

variable "aliases" {
  type        = list(string)
  default     = []
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
}

variable "logging_config" {
  type = optional(object({
    bucket          = string
    prefix          = optional(string, "")
    include_cookies = optional(bool, false)
  }))
  default     = null
  description = "(Optional) - CloudFront logging configuration."
}

variable "default_cache_behavior" {
  type = object({
    allowed_methods          = list(string)
    cached_methods           = list(string)
    target_origin_id         = string
    viewer_protocol_policy   = string
    cache_policy_id          = optional(string)
    origin_request_policy_id = optional(string)
    forwarded_values = optional(object({
      query_string = bool
      headers      = optional(list(string), [])
      cookies = optional(object({
        forward           = string
        whitelisted_names = optional(list(string), [])
      }))
    }))
    min_ttl     = optional(number, 0)
    default_ttl = optional(number, 86400)
    max_ttl     = optional(number, 31536000)
    compress    = optional(bool, true)
  })
  description = "(Required) - The default cache behavior."
}

variable "ordered_cache_behaviors" {
  type = list(object({
    path_pattern             = string
    allowed_methods          = list(string)
    cached_methods           = list(string)
    target_origin_id         = string
    viewer_protocol_policy   = string
    cache_policy_id          = optional(string)
    origin_request_policy_id = optional(string)
    forwarded_values = optional(object({
      query_string = bool
      headers      = optional(list(string), [])
      cookies = optional(object({
        forward           = string
        whitelisted_names = optional(list(string), [])
      }))
    }))
    min_ttl     = optional(number, 0)
    default_ttl = optional(number, 86400)
    max_ttl     = optional(number, 31536000)
    compress    = optional(bool, true)
  }))
  default     = []
  description = "(Optional) - List of ordered cache behaviors."
}

variable "price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."

  validation {
    condition     = contains(["PriceClass_All", "PriceClass_200", "PriceClass_100"], var.price_class)
    error_message = "price_class must be one of PriceClass_All, PriceClass_200, or PriceClass_100."
  }
}

variable "restrictions" {
  type = optional(object({
    geo_restriction = optional(object({
      restriction_type = string
      locations        = optional(list(string), [])
    }))
  }))
  default     = null
  description = "(Optional) - CloudFront restrictions (geo-blocking, etc)."
}

variable "viewer_certificate" {
  type = object({
    cloudfront_default_certificate = optional(bool, false)
    acm_certificate_arn            = optional(string)
    ssl_support_method             = optional(string)
    minimum_protocol_version       = optional(string, "TLSv1")
    iam_certificate_id             = optional(string)
  })
  default = {
    cloudfront_default_certificate = true
  }
  description = "(Optional) - The SSL certificate configuration for the distribution."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - A map of tags to assign to the resource."
}