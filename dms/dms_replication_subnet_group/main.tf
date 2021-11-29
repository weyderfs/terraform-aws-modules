resource "aws_dms_replication_subnet_group" "subnet_group" {
  replication_subnet_group_description = var.replication_subnet_group_description
  replication_subnet_group_id          = var.replication_subnet_group_id
  subnet_ids                           = var.subnet_ids
  tags                                 = var.tags
}