output "arn" {
    value = aws_cloudwatch_log_stream.cloudwatch_log_stream.arn
}

output "name" {
    value = aws_cloudwatch_log_stream.cloudwatch_log_stream.name
}