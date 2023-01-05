resource "aws_iam_policy_document" "policy_document" {
  dynamic "statement" {
    for_each = var.statement
    content {
      actions   = statement.value.actions
      effect    = statement.value.effect
      resources = statement.value.resources
      sid       = statement.value.sid
    }
  }
}