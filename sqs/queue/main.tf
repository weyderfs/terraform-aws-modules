resource "aws_sqs_queue" "sqs" {
  name                              = var.name
  delay_seconds                     = var.delay_seconds
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  redrive_policy                    = var.redrive_policy
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  tags                              = var.tags
}

resource "aws_sqs_queue_policy" "sqp" {
  queue_url = aws_sqs_queue.sqs.id
  count     = var.policy != null ? 1 : 0

  policy    = var.policy
}