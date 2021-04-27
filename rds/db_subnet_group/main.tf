resource "aws_db_subnet_group" "dsg" {
  name       = var.name
  subnet_ids = var.subnet_ids

  tags = var.tags
}