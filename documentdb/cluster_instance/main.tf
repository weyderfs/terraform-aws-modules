resource "aws_docdb_cluster_instance" "cluster_instances" {

  count                         = var.cluster_instances_count
  identifier                    = var.cluster_instances_identifier
  cluster_identifier            = var.cluster_instances_cluster_identifier
  instance_class                = var.cluster_instances_instance_class
  auto_minor_version_upgrade    = var.cluster_instance_auto_minor_version_upgrade
  engine                        = var.cluster_instance_engine
  identifier_prefix             = var.cluster_instances_identifier_prefix
  instance_class                = var.cluster_instances_instance_class
  preferred_maintenance_window  = var.cluster_instances_preferred_maintenance_window
  promotion_tier                = var.cluster_instances_promotion_tier
  arn                           = var.cluster_instances_arn
  db_subnet_group_name          = var.cluster_instances_db_subnet_group_name
  dbi_resource_id               = var.cluster_instances_dbi_resource_id
  endpoint                      = var.cluster_instances_endpoint
  engine_version                = var.cluster_instances_engine_version
  kms_key_id                    = var.cluster_identifier_kms_key_id
  port                          = var.cluster_identifier_port
  preferred_backup_window       = var.cluster_identifier_preferred_backup_window
  storage_encrypted             = var.cluster_identifier_storage_encrypted
  writer                        = var.cluster_identifier_writer
  ca_cert_identifier            = var.cluster_identifier_ca_cert_identifier
  

}

resource "aws_docdb_cluster" "cluster" {

  cluster_identifier          = var.cluster_identifier
  availability_zones          = var.cluster_availability_zones
  master_username             = var.cluster_master_username
  master_password             = var.cluster_master_password


}