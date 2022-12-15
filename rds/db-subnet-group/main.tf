resource "aws_db_subnet_group" "dsg" {
  name        = var.name
  subnet_ids  = var.subnet_ids
  description = var.description

  tags = var.tags
}