resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
  acl    = var.acl
  tags   = var.tags
  policy = file(var.policy)
  cors_rule {
    allowed_headers = var.allowed_headers
    allowed_methods = var.allowed_methods
    allowed_origins = var.allowed_origins
    expose_headers  = var.expose_headers

  }
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


