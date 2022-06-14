resource "aws_cloudwatch_event_rule" "aer" {
  name                = var.name
  description         = var.description
  schedule_expression = var.schedule_expression 
  
  event_pattern = var.event_pattern
}