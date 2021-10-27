resource "aws_elasticache_subnet_group" "aesg" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids

  tags = var.tags
}