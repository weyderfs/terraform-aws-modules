
output "key_arn" {
  value       = aws_kms_key.akk.arn
  description = "KMS key ARN"
}

output "key_id" {
  value       = aws_kms_key.akk.key_id
  description = "KMS key ID"
}

output "alias_arn" {
  value       = aws_kms_alias.aka.arn
  description = "KMS alias ARN"
}

output "alias_name" {
  value       = aws_kms_alias.aka.name
  description = "KMS alias name"
}
