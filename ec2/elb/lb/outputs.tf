output "lb_arn" {
  description = "Load balancer ARN"
  value       = aws_lb.al.arn
}

output "lb_id" {
  description = "Load balancer resource ID"
  value       = aws_lb.al.id
}

output "lb_name" {
  description = "Load balancer name"
  value       = aws_lb.al.name
}

output "lb_dns_name" {
  description = "Load balancer DNS name"
  value       = aws_lb.al.dns_name
}

output "lb_zone_id" {
  description = "Load balancer hosted zone ID (useful for Route53 alias)"
  value       = aws_lb.al.zone_id
}

output "listener_arns" {
  description = "Listener ARNs keyed by listener name"
  value       = { for k, v in aws_lb_listener.this : k => v.arn }
}
