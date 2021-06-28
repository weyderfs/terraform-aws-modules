output "name" {
  value         = aws_sqs_queue.sqs.name
  description   = "The name of SQS"
}

output "arn" {
  value         = aws_sqs_queue.sqs.arn
  description   = "ARN of SQS"
}