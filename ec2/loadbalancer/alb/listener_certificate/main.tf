resource "aws_lb_listener_certificate" "certificate" {
  listener_arn    = aws_lb_listener.listener.arn
  certificate_arn = var.certificate_arn
}
