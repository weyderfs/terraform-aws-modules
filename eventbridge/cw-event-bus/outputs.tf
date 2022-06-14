output "name" {
  value       = aws_cloudwatch_event_bus.ebb.name
}
output "arn" {
  value       = aws_cloudwatch_event_bus.ebb.arn
  description = "The Amazon Resource Name (ARN) of the event bus."
}
