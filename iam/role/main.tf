resource "aws_iam_role" "role" {
  name                = var.name
  assume_role_policy  = file(var.assume_role_policy)
  description         = var.description
  
  tags = var.tags
  
}