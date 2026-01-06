resource "aws_lb" "al" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection
  idle_timeout               = var.idle_timeout

  tags = var.tags

}

resource "aws_lb_listener" "http" {
  count             = var.enable_http ? 1 : 0
  load_balancer_arn = aws_lb.al.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = var.http_default_action_type

    # When type == "redirect", emit the redirect block
    dynamic "redirect" {
      for_each = var.http_default_action_type == "redirect" ? [1] : []
      content {
        port        = var.http_redirect_port
        protocol    = var.http_redirect_protocol
        status_code = var.http_redirect_status_code
        host        = var.http_redirect_host
        path        = var.http_redirect_path
        query       = var.http_redirect_query
      }
    }

    # When type == "forward", set target_group_arn; otherwise omit it
    target_group_arn = var.http_default_action_type == "forward" ? var.http_target_group_arn : null
  }
}

resource "aws_lb_listener" "https" {
  count             = var.enable_https ? 1 : 0
  load_balancer_arn = aws_lb.al.arn
  port              = var.https_port
  protocol          = var.https_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = var.https_default_action_type
    target_group_arn = var.https_target_group_arn
  }
}
