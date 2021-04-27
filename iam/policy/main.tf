resource "aws_iam_policy" "policy" {
  name        = var.name
  path        = var.path
  description = var.description

  policy = file(var.policy)

  tags = var.tags

}