output "name" {
  value       = aws_lb.alb.name
  description = "KMS ARN"
}

output "arn" {
  value       = aws_lb.alb.arn
  description = "KMS ARN"
}

output "id" {
  value       = aws_lb.alb.id
  description = "ID of Loadbalancer"
}

output "load_balancer_type" {
    value   = aws_lb.alb.load_balancer_type
    description = "Type of LB"
}

output "dns_name" {
    value   = aws_lb.alb.dns_name
    description = "Type of LB"
}

output "idle_timeout" {
    value   = aws_lb.alb.idle_timeout 
    description = "The Timeout of LB"
}

