output "id" {
  description = "The ACM ID"
  value       = aws_acm_certificate.acm.id
}

output "domain_name" {
  description = "The ACM Domain Name"
  value       = aws_acm_certificate.acm.domain_name
}