resource "aws_sns_topic_subscription" "subscription" {
  topic_arn                       = var.topic_arn 
  protocol                        = var.protocol 
  endpoint                        = var.endpoint 
  endpoint_auto_confirms          = var.endpoint_auto_confirms 
  confirmation_timeout_in_minutes = var.confirmation_timeout_in_minutes 
  raw_message_delivery            = var.raw_message_delivery 
  filter_policy                   = var.filter_policy 
  delivery_policy                 = var.delivery_policy 
}