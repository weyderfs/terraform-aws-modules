resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = var.name
  retention_in_days = var.retention_in_days
  tags = var.tags
}
