resource "aws_s3_bucket" "asb" {
  bucket  = var.bucket
  tags    = var.tags
}

resource "aws_s3_bucket_acl" "asba" {
  bucket = aws_s3_bucket.asb.bucket
  acl    = var.acl
}

resource "aws_s3_bucket_policy" "asbp" {
  bucket = aws_s3_bucket.asb.bucket
  policy = var.policy
}

resource "aws_s3_bucket_website_configuration" "aswc" {
  bucket = aws_s3_bucket.asb.bucket

  index_document {
    suffix = var.index_document_suffix
  }

  error_document {
    key = var.index_document_error_document_key
  }

}
