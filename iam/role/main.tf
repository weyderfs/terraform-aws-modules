resource "aws_iam_role" "role" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  description           = var.description
  max_session_duration  = var.max_session_duration
  
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  for_each = var.policies

  role       = aws_iam_role.role.name
  policy_arn = each.value
}
