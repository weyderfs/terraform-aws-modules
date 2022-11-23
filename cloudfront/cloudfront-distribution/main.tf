resource "aws_cloudfront_distribution" "acd" {

  origin {
    domain_name              = var.domain_name
    origin_access_control_id = var.origin_access_control_id
    origin_id                = var.origin_id
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  logging_config {
    include_cookies = var.logging_config_include_cookies
    bucket          = var.logging_config_bucket
    prefix          = var.logging_config_prefix
  }

  aliases = var.aliases

  default_cache_behavior {
    allowed_methods  = var.default_cache_behavior_allowed_methods
    cached_methods   = var.default_cache_behavior_cached_methods
    target_origin_id = var.default_cache_behavior_target_origin_id

    forwarded_values {
      query_string = var.default_cache_behavior_forwarded_values_query_string

      cookies {
        forward = var.default_cache_behavior_forwarded_values_cookies_foward
      }
    }

    viewer_protocol_policy = var.default_cache_behavior_viewer_protocol_policy
    min_ttl                = var.default_cache_behavior_min_ttl
    default_ttl            = var.default_cache_behavior_default_ttl
    max_ttl                = var.default_cache_behavior_max_ttl
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = var.ordered_cache_behavior_path_pattern
    allowed_methods  = var.ordered_cache_behavior_path_allowed_methods
    cached_methods   = var.ordered_cache_behavior_path_cached_methods
    target_origin_id = var.var.ordered_cache_behavior_path_target_origin_id

    forwarded_values {
      query_string = var.ordered_cache_behavior_forwarded_values_query_string
      headers      = var.ordered_cache_behavior_forwarded_values_headers

      cookies {
        forward = var.ordered_cache_behavior_forwarded_values_cookies_forward
      }
    }

    min_ttl                = var.ordered_cache_behavior_min_ttl
    default_ttl            = var.ordered_cache_behavior_default_ttl
    max_ttl                = var.ordered_cache_behavior_max_ttl
    compress               = var.ordered_cache_behavior_compress
    viewer_protocol_policy = var.ordered_cache_behavior_viewer_protocol_policy
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.restrictions_geo_restriction_restriction_type
      locations        = var.restrictions_geo_restriction_locations
    }
  }

  tags = var.tags

  viewer_certificate {
    cloudfront_default_certificate = var.viewer_certificate_cloudfront_default_certificate
  }
}