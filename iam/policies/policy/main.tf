resource "aws_iam_policy" "aip" {
  name        = var.name
  path        = var.path
  description = var.description
  policy      = var.policy

  tags = var.tags

}