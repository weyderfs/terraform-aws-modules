resource "aws_cloudwatch_event_target" "aet" {
  target_id = var.target_id
  rule      = var.rule
  arn       = var.arn

  run_command_targets = var.run_command_targets
}