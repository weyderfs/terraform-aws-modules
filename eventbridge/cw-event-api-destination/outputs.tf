output "name" {
  value       = aws_cloudwatch_event_api_destination.ebad.name
  description = "The Event Bridge Name"
}

output "arn" {
  value       = aws_cloudwatch_event_api_destination.ebad.arn
  description = "The Amazon Resource Name (ARN) of the event API Destination."
}