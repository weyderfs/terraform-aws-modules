resource "aws_dms_endpoint" "endpoint" {
  # Default
  endpoint_type = var.endpoint_type
  endpoint_id = var.endpoint_id
  engine_name = var.engine_name
  extra_connection_attributes = var.extra_connection_attributes
  tags = var.tags
  
  # Database
  server_name = var.server_name
  port = var.port
  username = var.username
  password = var.password
  ssl_mode = var.ssl_mode

  # S3
  dynamic "s3_settings" {
    for_each = var.s3_settings
    content {
      service_access_role_arn = s3_settings.value.service_access_role_arn
      bucket_name = s3_settings.value.bucket_name
      bucket_folder = s3_settings.value.bucket_folder
    }
  }
}

