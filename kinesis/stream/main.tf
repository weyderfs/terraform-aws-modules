resource "aws_kinesis_stream" "aks" {
  name              = var.name
  shard_count       = var.shard_count
  retention_period  = var.retention_period
  encryption_type   = var.encryption_type

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = var.tags
}