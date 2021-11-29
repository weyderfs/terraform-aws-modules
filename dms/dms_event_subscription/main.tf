resource "aws_dms_event_subscription" "event_subscription" {
  enabled          = var.enabled
  event_categories = var.event_categories
  name             = var.name
  sns_topic_arn    = var.sns_topic_arn
  source_ids       = var.source_ids
  source_type      = var.source_type
  tags             = var.tags
}