resource "aws_iam_role" "air" {
  name                 = var.name
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
  managed_policy_arns  = var.managed_policy_arns
  tags                 = var.tags
}