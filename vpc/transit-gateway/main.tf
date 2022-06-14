resource "aws_ec2_transit_gateway" "tg" {
  description = var.description
  amazon_side_asn = var.amazon_side_asn
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
}
