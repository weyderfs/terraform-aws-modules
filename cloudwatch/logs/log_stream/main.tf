resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  name           = var.name
  log_group_name = var.log_group_name
}
