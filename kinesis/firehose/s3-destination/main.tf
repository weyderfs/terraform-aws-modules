resource "aws_kinesis_firehose_delivery_stream" "akfds" {
  name        = var.name
  destination = "extended_s3"
  
 
  extended_s3_configuration {
    role_arn            = var.role_arn
    bucket_arn          = var.bucket_arn
    prefix              = var.prefix
    error_output_prefix = var.error_output_prefix
    s3_backup_mode      = var.s3_backup_mode
    buffer_size         = var.buffer_size
    buffer_interval     = var.buffer_interval
    cloudwatch_logging_options {
      enabled         = var.cloudwatch_enable
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }  
  } 
  tags = var.tags
}