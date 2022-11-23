output "bucket" {
  value       = aws_s3_bucket_website_configuration.aswc.bucket
  description = "Name of the Bucket"
}
