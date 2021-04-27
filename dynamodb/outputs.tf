output "arn" {
    description = "The arn of the table"
    value       = aws_dynamodb_table.dynamodb.arn
}

output "id" {
    description = "The name of the table"
    value       = aws_dynamodb_table.dynamodb.id
}