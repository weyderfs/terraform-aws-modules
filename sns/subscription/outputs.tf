output "id" {
  value = aws_sns_topic_subscription.subscription.id
  description = "The ARN of the subscription"
}

output "topic_arn" {
  value = aws_sns_topic_subscription.subscription.topic_arn
  description = "The ARN of the topic the subscription belongs to"
}

output "protocol" {
  value = aws_sns_topic_subscription.subscription.protocol
  description = "The protocol being used"
}

output "endpoint" {
  value = aws_sns_topic_subscription.subscription.endpoint
  description = "The full endpoint to send data to (SQS ARN, HTTP(S) URL, Application ARN, SMS number, etc.)"
}

output "arn" {
  value = aws_sns_topic_subscription.subscription.arn
  description = "The ARN of the subscription stored as a more user-friendly property"
}