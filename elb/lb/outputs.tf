output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.al.arn
}

output "alb_id" {
  description = "ALB resource ID"
  value       = aws_lb.al.id
}

output "alb_name" {
  description = "ALB name"
  value       = aws_lb.al.name
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.al.dns_name
}

output "alb_zone_id" {
  description = "ALB hosted zone ID (useful for Route53 alias)"
  value       = aws_lb.al.zone_id
}

# Conditional outputs for listeners
output "http_listener_arn" {
  description = "HTTP listener ARN (null if disabled)"
  value       = try(aws_lb_listener.http[0].arn, null)
}

output "https_listener_arn" {
  description = "HTTPS listener ARN (null if disabled)"
  value       = try(aws_lb_listener.https[0].arn, null)
}
