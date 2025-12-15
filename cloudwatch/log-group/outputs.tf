output "name" {
  description = "Name of the ECR repository."
  value       = aws_cloudwatch_log_group.aclg.name
}