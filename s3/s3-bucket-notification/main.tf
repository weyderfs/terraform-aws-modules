resource "aws_s3_bucket_notification" "sbn" {
  bucket = var.bucket

  queue {
    queue_arn       = var.queue_arn
    events          = var.events
    filter_prefix   = var.filter_prefix
    filter_suffix    = var.filter_suffix    
  }
}