resource "aws_kinesis_stream_consumer" "aksc" {
  name       = var.name
  stream_arn = var.stream_arn
}