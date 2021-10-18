resource "aws_kinesis_firehose_delivery_stream" "akfds" {
  name        = var.name
  destination = "extended_s3"
  
  kinesis_source_configuration {
    kinesis_stream_arn  = var.kinesis_stream_arn
    role_arn            = var.role_arn
  }
  
  extended_s3_configuration {
    role_arn                = var.extended_s3_configuration_role_arn
    bucket_arn              = var.extended_s3_configuration_bucket_arn
    error_output_prefix     = var.extended_s3_configuration_error_output_prefix
    s3_backup_mode          = var.extended_s3_configuration_s3_backup_mode
    
    processing_configuration {
      enabled = var.processing_configuration_enable
      processors {
        type = var.processors_type
        parameters {
          parameter_name  = var.parameter_processor_name
          parameter_value = var.parameter_processor_value
        }
      }
    }
  }
  tags = var.tags
}