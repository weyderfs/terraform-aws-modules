output "arn" {
  value       = aws_kms_key.kms[0].arn
  description = "KMS ARN"
}

output "name" {
  value       = aws_kms_alias.kms_alias.name
  description = "KMS Key Name"
}

