resource "aws_cloudwatch_event_archive" "eba" {
  name             = var.name
  description      = var.description
  event_source_arn = var.event_source_arn
  retention_days   = var.retention_days
  event_pattern    = var.event_pattern
}