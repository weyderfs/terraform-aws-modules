resource "aws_s3_bucket" "s3"{
  bucket        = var.bucket
  acl           = var.acl
  tags          = var.tags
  
  cors_rule {
    allowed_headers = var.allowed_headers
    allowed_methods = var.allowed_methods
    allowed_origins = var.allowed_origins
    expose_headers  = var.expose_headers
    
  }
}


resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.s3.bucket
  policy = file(var.policy)
}