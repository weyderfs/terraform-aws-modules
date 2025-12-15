resource "aws_iam_policy" "aip" {
  name        = var.name
  description = var.description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = var.role_name
  policy_arn = aws_iam_policy.aip.arn
}