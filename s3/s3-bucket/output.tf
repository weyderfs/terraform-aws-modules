output "s3_arn" {
  value       = aws_s3_bucket.s3.arn
  description = "s3_arn"
}

output "bucket" {
  value       = aws_s3_bucket.s3.bucket
  description = "Name of Bucket"
}
