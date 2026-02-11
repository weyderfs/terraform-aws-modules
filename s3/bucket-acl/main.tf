locals {
  use_logging     = var.logging_target_bucket != null && var.logging_target_bucket != ""
  enable_baseline = var.enforce_tls || var.enforce_sse
  enable_policy   = local.enable_baseline || (var.policy != null && var.policy != "")
}

resource "aws_s3_bucket" "asb" {
  bucket        = var.bucket
  force_destroy = var.force_destroy

  tags = var.tags
}

resource "aws_s3_bucket_ownership_controls" "asboc" {
  bucket = aws_s3_bucket.asb.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "asba" {
  depends_on = [aws_s3_bucket_ownership_controls.asboc]
  
  bucket = aws_s3_bucket.asb.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "asbv" {
  bucket = aws_s3_bucket.asb.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "asbpab" {
  bucket = aws_s3_bucket.asb.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_server_side_encryption_configuration" "asbsec" {
  bucket = aws_s3_bucket.asb.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.sse_algorithm == "aws:kms" ? var.kms_key_id : null
    }

    bucket_key_enabled = var.bucket_key_enabled
  }
}

resource "aws_s3_bucket_logging" "asbl" {
  count = local.use_logging ? 1 : 0

  bucket        = aws_s3_bucket.asb.id
  target_bucket = var.logging_target_bucket
  target_prefix = var.logging_target_prefix != null ? var.logging_target_prefix : ""
}

resource "aws_s3_bucket_lifecycle_configuration" "asblc" {
  count  = var.enable_lifecycle_rules ? 1 : 0
  bucket = aws_s3_bucket.asb.id

  rule {
    id     = "abort-incomplete-multipart"
    status = var.enable_abort_incomplete_multipart_upload ? "Enabled" : "Disabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = var.abort_incomplete_multipart_upload_days
    }
  }
}

data "aws_iam_policy_document" "baseline" {
  count = local.enable_baseline ? 1 : 0

  dynamic "statement" {
    for_each = var.enforce_tls ? [1] : []
    content {
      sid     = "DenyInsecureTransport"
      effect  = "Deny"
      actions = ["s3:*"]
      resources = [
        aws_s3_bucket.asb.arn,
        "${aws_s3_bucket.asb.arn}/*"
      ]

      principals {
        type        = "*"
        identifiers = ["*"]
      }

      condition {
        test     = "Bool"
        variable = "aws:SecureTransport"
        values   = ["false"]
      }
    }
  }

  dynamic "statement" {
    for_each = var.enforce_sse ? [1] : []
    content {
      sid     = "DenyUnencryptedUploads"
      effect  = "Deny"
      actions = ["s3:PutObject"]
      resources = [
        "${aws_s3_bucket.asb.arn}/*"
      ]

      principals {
        type        = "*"
        identifiers = ["*"]
      }

      condition {
        test     = "Null"
        variable = "s3:x-amz-server-side-encryption"
        values   = ["true"]
      }
    }
  }

  dynamic "statement" {
    for_each = var.enforce_sse ? [1] : []
    content {
      sid     = "DenyIncorrectEncryptionHeader"
      effect  = "Deny"
      actions = ["s3:PutObject"]
      resources = [
        "${aws_s3_bucket.asb.arn}/*"
      ]

      principals {
        type        = "*"
        identifiers = ["*"]
      }

      condition {
        test     = "StringNotEquals"
        variable = "s3:x-amz-server-side-encryption"
        values   = [var.sse_algorithm]
      }
    }
  }
}

data "aws_iam_policy_document" "combined" {
  count = local.enable_policy ? 1 : 0
  source_policy_documents = compact(concat(
    local.enable_baseline ? [data.aws_iam_policy_document.baseline[0].json] : [],
    var.policy != null && var.policy != "" ? [var.policy] : []
  ))
}

resource "aws_s3_bucket_policy" "asbp" {
  count  = local.enable_policy ? 1 : 0
  bucket = aws_s3_bucket.asb.id
  policy = data.aws_iam_policy_document.combined[0].json
}