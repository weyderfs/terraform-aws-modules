output "id" {
  description = "The ACM ID"
  value       = aws_acm_certificate.acm.id
}

output "arn" {
  description = "The ACM ARN"
  value       = aws_acm_certificate.acm.arn
}

output "domain_name" {
  description = "The ACM Domain Name"
  value       = aws_acm_certificate.acm.domain_name
}

output "status" {
  description = "The ACM certificate status"
  value       = aws_acm_certificate.acm.status
}

output "subject_alternative_names" {
  description = "The ACM Subject Alternative Names"
  value       = aws_acm_certificate.acm.subject_alternative_names
}

output "validation_emails" {
  description = "Validation email addresses for EMAIL validation"
  value       = aws_acm_certificate.acm.validation_emails
}

output "domain_validation_options" {
  description = "Domain validation options for DNS/EMAIL validation"
  value       = aws_acm_certificate.acm.domain_validation_options
}

output "not_before" {
  description = "Certificate validity start date"
  value       = aws_acm_certificate.acm.not_before
}

output "not_after" {
  description = "Certificate validity end date"
  value       = aws_acm_certificate.acm.not_after
}