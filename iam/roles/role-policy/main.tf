resource "aws_iam_role_policy" "irp" {
  name   = var.name
  role   = var.role
  policy = var.policy
}
