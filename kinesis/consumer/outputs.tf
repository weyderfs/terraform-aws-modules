output "name" {
  value       = aws_kinesis_stream_consumer.aksc.name
  description = "The Kinesis Consumer Name"
}

output "stream_arn" {
  value       = aws_kinesis_stream_consumer.aksc.stream_arn
  description = "The Kinesis Consumer Stream ARN"
}
