resource "aws_cloudfront_distribution" "s3_distribution" {


  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object
  aliases             = var.aliases
  price_class         = var.price_class

  dynamic "origin" {
    for_each  = var.origin
    content {
      
      domain_name               = origin.value.domain_name
      origin_id                 = origin.value.origin_id

      s3_origin_config {
        origin_access_identity = origin.value.origin_access_identity
      }
    }
  }

  logging_config {
    include_cookies = var.logging_config_include_cookies
    bucket          = var.logging_config_include_bucket
    prefix          = var.logging_config_include_prefix
  }

  dynamic "default_cache_behavior" {
    for_each  = var.default_cache_behavior
    content {
      
      allowed_methods         = default_cache_behavior.value.allowed_methods
      cached_methods          = default_cache_behavior.value.cached_methods
      target_origin_id        = default_cache_behavior.value.target_origin_id
      viewer_protocol_policy  = default_cache_behavior.value.viewer_protocol_policy
      min_ttl                 = default_cache_behavior.value.min_ttl
      default_ttl             = default_cache_behavior.value.default_ttl
      max_ttl                 = default_cache_behavior.value.max_ttl

      forwarded_values {
        query_string  = default_cache_behavior.value.query_string
        headers       = default_cache_behavior.value.headers

        cookies {
          forward = default_cache_behavior.value.forward

        }
      }
    }
  }

  restrictions {
    dynamic "geo_restriction" {
      for_each  = var.geo_restriction
      content {
        restriction_type = geo_restriction.value.restriction_type
        locations        = geo_restriction.value.locations
      }

    }
  }

  dynamic "viewer_certificate" {
    for_each  = var.viewer_certificate
    content {
      
      acm_certificate_arn             = viewer_certificate.value.acm_certificate_arn
      cloudfront_default_certificate  = viewer_certificate.value.cloudfront_default_certificate
      iam_certificate_id              = viewer_certificate.value.iam_certificate_id
      minimum_protocol_version        = viewer_certificate.value.minimum_protocol_version
      ssl_support_method              = viewer_certificate.value.ssl_support_method

    }

  }
}