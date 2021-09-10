resource "aws_route53_zone" "zone" {
  name    = var.name
  comment = var.comment
  tags    = var.tags
  
  dynamic "vpc"  {
    for_each  = var.vpcs
    content {
      vpc_id = vpc.value.vpc_id
      vpc_region = vpc.value.vpc_region
    }
  }
}