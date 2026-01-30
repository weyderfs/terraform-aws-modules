output "id" {
  description = "The CloudFront distribution ID."
  value       = aws_cloudfront_distribution.acd.id
}

output "arn" {
  description = "The ARN of the CloudFront distribution."
  value       = aws_cloudfront_distribution.acd.arn
}

output "domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = aws_cloudfront_distribution.acd.domain_name
}

output "etag" {
  description = "The current version of the distribution's information."
  value       = aws_cloudfront_distribution.acd.etag
}

output "status" {
  description = "The current status of the distribution. Deployed or InProgress."
  value       = aws_cloudfront_distribution.acd.status
}

output "caller_reference" {
  description = "Internal value used by CloudFront to uniquely identify the distribution."
  value       = aws_cloudfront_distribution.acd.caller_reference
}

output "hosted_zone_id" {
  description = "The CloudFront hosted zone ID that can be used to create Route53 alias records."
  value       = aws_cloudfront_distribution.acd.hosted_zone_id
}

output "origin_group_id" {
  description = "The origin group IDs associated with the distribution."
  value       = try(aws_cloudfront_distribution.acd.origin_group[*].id, [])
}

output "distribution" {
  description = "The full CloudFront distribution object."
  value       = aws_cloudfront_distribution.acd
  sensitive   = false
}