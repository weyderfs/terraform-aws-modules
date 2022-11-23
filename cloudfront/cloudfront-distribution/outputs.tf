output "id" {
  description = "The Cloudfront ID"
  value       = aws_cloudfront_distribution.acd.id
}

output "arn" {
  description = "The ARN of CDN"
  value       = aws_cloudfront_distribution.acd.arn
}

output "domain_name" {
  description = "The DNS domain name of either the S3 bucket"
  value       = aws_cloudfront_distribution.acd.domain_name
}