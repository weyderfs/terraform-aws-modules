output "id" {
  value       = aws_cloudwatch_event_rule.aer.id
}
output "arn" {
  value       = aws_cloudwatch_event_rule.aer.arn
  description = "The Amazon Resource Name (ARN)"
}
