resource "aws_subnet" "subnet" {
  vpc_id                = var.vpc_id
  cidr_block            = var.cidr_block
  availability_zone     = var.availability_zone

  tags = var.tags
  
}