resource "aws_s3_bucket" "asb" {
  bucket = var.bucket

  tags = var.tags
}

resource "aws_s3_bucket_acl" "asba" {
  bucket = aws_s3_bucket.asb.id
  acl    = var.acl
}