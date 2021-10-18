output "name" {
  value       = aws_kinesis_stream.aks.name
  description = "Kinesis Stream name"
}
output "shard_count" {
  value       = aws_kinesis_stream.aks.shard_count
  description = "Shards count"
}
output "retention_period" {
  value       = aws_kinesis_stream.aks.retention_period
  description = "Stream's retention period"
}