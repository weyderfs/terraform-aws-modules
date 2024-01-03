resource "aws_s3_bucket" "asb" {
  bucket = var.bucket

  tags = var.tags
}
