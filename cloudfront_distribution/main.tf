resource "aws_cloudfront_distribution" "cdn" {


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
      
      custom_origin_config  {
        
        http_port                 = origin.value.origin_http_port
        https_port                = origin.value.origin_https_port
        origin_protocol_policy    = origin.value.origin_protocol_policy
        origin_ssl_protocols      = origin.value.origin_ssl_protocols
        origin_keepalive_timeout  = origin.value.origin_keepalive_timeout
        origin_read_timeout       = origin.value.origin_read_timeout

      }
    }
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