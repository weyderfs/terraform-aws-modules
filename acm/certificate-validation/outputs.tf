output "id" {
  description = "The ACM certificate validation ID"
  value       = aws_acm_certificate_validation.aacv.id
}

output "certificate_arn" {
  description = "The ACM certificate ARN"
  value       = aws_acm_certificate_validation.aacv.certificate_arn
}
