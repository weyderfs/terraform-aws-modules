resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
  acl    = var.acl
  tags   = var.tags
  policy = var.policy
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  lifecycle_rule {
    id      = var.id
    prefix  = var.prefix
    enabled = var.enabled

    expiration {
      days = var.days
    }
  }
}


