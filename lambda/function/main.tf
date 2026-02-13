resource "aws_lambda_function" "lambda" {
  filename          = var.filename
  s3_bucket         = var.s3_bucket
  s3_key            = var.s3_key
  s3_object_version = var.s3_object_version
  function_name     = var.function_name
  role              = var.role_arn
  handler           = var.handler
  runtime           = var.runtime
  timeout           = var.timeout
  memory_size       = var.memory_size
  architectures     = var.architectures

  environment {
    variables = var.environment_variables
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [1] : []
    content {
      subnet_ids         = var.vpc_subnet_ids
      security_group_ids = var.vpc_security_group_ids
    }
  }

  # Prevent replacement when source code changes
  source_code_hash = var.filename != null ? filebase64sha256(var.filename) : null

  lifecycle {
    precondition {
      condition = (
        var.filename != null && var.s3_bucket == null && var.s3_key == null
      ) || (
        var.filename == null && var.s3_bucket != null && var.s3_key != null
      )
      error_message = "Provide either filename or s3_bucket + s3_key, but not both."
    }
  }

  tags = var.tags
}
