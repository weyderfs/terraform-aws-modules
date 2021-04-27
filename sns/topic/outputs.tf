output "name" {
  value = aws_sns_topic.topic.name
  description = "The name of SNS"
}

output "arn" {
  value = aws_sns_topic.topic.arn
  description = "The ARN of SNS"
}

output "id" {
  value = aws_sns_topic.topic.id
  description = "The id of SNS"
}