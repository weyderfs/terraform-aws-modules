resource "aws_lb" "al" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = lower(var.load_balancer_type) == "application" ? var.security_group_ids : null
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection
  idle_timeout               = lower(var.load_balancer_type) == "application" ? var.idle_timeout : null

  tags = var.tags
}

locals {
  listeners_map = {
    for l in var.listeners : l.name => l
  }
}
resource "aws_lb_listener" "this" {
  for_each         = local.listeners_map
  load_balancer_arn = aws_lb.al.arn
  port              = each.value.port
  protocol          = each.value.protocol
  ssl_policy        = try(each.value.ssl_policy, null)
  certificate_arn   = try(each.value.certificate_arn, null)
  alpn_policy       = try(each.value.alpn_policy, null)

  default_action {
    type             = each.value.default_action.type
    target_group_arn = try(each.value.default_action.target_group_arn, null)

    dynamic "redirect" {
      for_each = try(each.value.default_action.redirect, null) != null ? [each.value.default_action.redirect] : []
      content {
        port        = redirect.value.port
        protocol    = redirect.value.protocol
        status_code = redirect.value.status_code
        host        = try(redirect.value.host, null)
        path        = try(redirect.value.path, null)
        query       = try(redirect.value.query, null)
      }
    }

    dynamic "fixed_response" {
      for_each = try(each.value.default_action.fixed_response, null) != null ? [each.value.default_action.fixed_response] : []
      content {
        content_type = fixed_response.value.content_type
        message_body = try(fixed_response.value.message_body, null)
        status_code  = fixed_response.value.status_code
      }
    }
  }
}
