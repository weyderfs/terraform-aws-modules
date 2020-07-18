resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.cluster_instances_count
  identifier         = var.cluster_instances_identifier
  cluster_identifier = var.cluster_instances_cluster_identifier
  instance_class     = var.cluster_instances_instance_class
}

resource "aws_docdb_cluster" "cluster" {
  cluster_identifier = var.cluster_identifier
  availability_zones = var.cluster_availability_zones
  master_username    = var.cluster_master_username
  master_password    = var.cluster_master_password
}