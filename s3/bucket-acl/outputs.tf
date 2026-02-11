output "bucket" {
  value       = aws_s3_bucket.asb.bucket
  description = "Name of Bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.asb.arn
  description = "Bucket ARN"
}

output "bucket_id" {
  value       = aws_s3_bucket.asb.id
  description = "Bucket ID"
}
