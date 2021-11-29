output "name" {
    value = aws_dms_event_subscription.event_subscription.name
}

output "sns_topic_arn" {
    value = aws_dms_event_subscription.event_subscription.sns_topic_arn
}