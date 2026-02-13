output "name" {
  description = "Name of the CloudWatch Log Group."
  value       = aws_cloudwatch_log_group.aclg.name
}

output "arn" {
  description = "ARN of the CloudWatch Log Group."
  value       = aws_cloudwatch_log_group.aclg.arn
}

output "kms_key_id" {
  description = "KMS Key ID used for encryption (if configured)."
  value       = aws_cloudwatch_log_group.aclg.kms_key_id
}