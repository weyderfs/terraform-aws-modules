resource "aws_cloudfront_distribution" "acd" {

  dynamic "origin" {
    for_each = var.origins
    content {
      domain_name              = origin.value.domain_name
      origin_id                = origin.value.origin_id
      origin_access_control_id = try(origin.value.origin_access_control_id, null)
      origin_path              = try(origin.value.origin_path, "")

      dynamic "custom_header" {
        for_each = try(origin.value.custom_headers, [])
        content {
          name  = custom_header.value.name
          value = custom_header.value.value
        }
      }

      dynamic "custom_origin_config" {
        for_each = try(origin.value.custom_origin_config, null) != null ? [origin.value.custom_origin_config] : []
        content {
          http_port              = custom_origin_config.value.http_port
          https_port             = custom_origin_config.value.https_port
          origin_protocol_policy = custom_origin_config.value.origin_protocol_policy
          origin_ssl_protocols   = custom_origin_config.value.origin_ssl_protocols
        }
      }
    }
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  dynamic "logging_config" {
    for_each = var.logging_config != null ? [var.logging_config] : []
    content {
      include_cookies = logging_config.value.include_cookies
      bucket          = logging_config.value.bucket
      prefix          = try(logging_config.value.prefix, "")
    }
  }

  aliases = var.aliases

  default_cache_behavior {
    allowed_methods  = var.default_cache_behavior.allowed_methods
    cached_methods   = var.default_cache_behavior.cached_methods
    target_origin_id = var.default_cache_behavior.target_origin_id

    dynamic "cache_policy_id" {
      for_each = try(var.default_cache_behavior.cache_policy_id, null) != null ? [var.default_cache_behavior.cache_policy_id] : []
      content {
        id = cache_policy_id.value
      }
    }

    dynamic "origin_request_policy_id" {
      for_each = try(var.default_cache_behavior.origin_request_policy_id, null) != null ? [var.default_cache_behavior.origin_request_policy_id] : []
      content {
        id = origin_request_policy_id.value
      }
    }

    # Fallback para forwarded_values (deprecated, mas ainda suportado)
    dynamic "forwarded_values" {
      for_each = try(var.default_cache_behavior.cache_policy_id, null) == null ? [var.default_cache_behavior.forwarded_values] : []
      content {
        query_string = forwarded_values.value.query_string
        headers      = try(forwarded_values.value.headers, [])

        dynamic "cookies" {
          for_each = try(forwarded_values.value.cookies, null) != null ? [forwarded_values.value.cookies] : []
          content {
            forward           = cookies.value.forward
            whitelisted_names = try(cookies.value.whitelisted_names, [])
          }
        }
      }
    }

    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    min_ttl                = try(var.default_cache_behavior.min_ttl, 0)
    default_ttl            = try(var.default_cache_behavior.default_ttl, 86400)
    max_ttl                = try(var.default_cache_behavior.max_ttl, 31536000)
    compress               = try(var.default_cache_behavior.compress, true)
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behaviors
    content {
      path_pattern     = ordered_cache_behavior.value.path_pattern
      allowed_methods  = ordered_cache_behavior.value.allowed_methods
      cached_methods   = ordered_cache_behavior.value.cached_methods
      target_origin_id = ordered_cache_behavior.value.target_origin_id

      dynamic "cache_policy_id" {
        for_each = try(ordered_cache_behavior.value.cache_policy_id, null) != null ? [ordered_cache_behavior.value.cache_policy_id] : []
        content {
          id = cache_policy_id.value
        }
      }

      dynamic "origin_request_policy_id" {
        for_each = try(ordered_cache_behavior.value.origin_request_policy_id, null) != null ? [ordered_cache_behavior.value.origin_request_policy_id] : []
        content {
          id = origin_request_policy_id.value
        }
      }

      dynamic "forwarded_values" {
        for_each = try(ordered_cache_behavior.value.cache_policy_id, null) == null ? [ordered_cache_behavior.value.forwarded_values] : []
        content {
          query_string = forwarded_values.value.query_string
          headers      = try(forwarded_values.value.headers, [])

          dynamic "cookies" {
            for_each = try(forwarded_values.value.cookies, null) != null ? [forwarded_values.value.cookies] : []
            content {
              forward           = cookies.value.forward
              whitelisted_names = try(cookies.value.whitelisted_names, [])
            }
          }
        }
      }

      viewer_protocol_policy = ordered_cache_behavior.value.viewer_protocol_policy
      min_ttl                = try(ordered_cache_behavior.value.min_ttl, 0)
      default_ttl            = try(ordered_cache_behavior.value.default_ttl, 86400)
      max_ttl                = try(ordered_cache_behavior.value.max_ttl, 31536000)
      compress               = try(ordered_cache_behavior.value.compress, true)
    }
  }

  price_class = var.price_class

  dynamic "restrictions" {
    for_each = var.restrictions != null ? [var.restrictions] : []
    content {
      dynamic "geo_restriction" {
        for_each = try(restrictions.value.geo_restriction, null) != null ? [restrictions.value.geo_restriction] : []
        content {
          restriction_type = geo_restriction.value.restriction_type
          locations        = try(geo_restriction.value.locations, [])
        }
      }
    }
  }

  dynamic "viewer_certificate" {
    for_each = [var.viewer_certificate]
    content {
      cloudfront_default_certificate = try(viewer_certificate.value.cloudfront_default_certificate, false)
      acm_certificate_arn            = try(viewer_certificate.value.acm_certificate_arn, null)
      ssl_support_method             = try(viewer_certificate.value.ssl_support_method, null)
      minimum_protocol_version       = try(viewer_certificate.value.minimum_protocol_version, "TLSv1")
      iam_certificate_id             = try(viewer_certificate.value.iam_certificate_id, null)
    }
  }

  tags = var.tags
}