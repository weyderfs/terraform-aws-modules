output "name" {
  value       = aws_cloudwatch_event_archive.eba.name
  description = "The Event Bridge Name"
}

output "arn" {
  value       = aws_cloudwatch_event_archive.eba.arn
  description = "The Amazon Resource Name (ARN) of the event API Destination."
}