output "name" {
  value       = aws_kinesis_firehose_delivery_stream.akfds.name
  description = "Kinesis firehose name"
}

output "destination" {
  value       = aws_kinesis_firehose_delivery_stream.akfds.destination
  description = "Kinesis firehose destination"
}