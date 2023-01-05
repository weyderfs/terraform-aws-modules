resource "aws_iam_user" "user" {

  name = var.name
  path = var.path

  tags = var.tags
}

resource "aws_iam_access_key" "user" {

  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "policy" {
  name   = var.policy_name
  user   = aws_iam_user.user.name
  policy = file(var.policy)
}



