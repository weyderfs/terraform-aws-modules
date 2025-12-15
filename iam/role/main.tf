resource "aws_iam_role" "air" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  tags               = var.tags
}
