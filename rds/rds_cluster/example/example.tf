locals  {
    
    cluster_identifier      = "my-cluster-name"
    engine                  = "my-cluster-name"
    engine_version          = "5.7.mysql_aurora.2.07.2"
    availability_zones      = ["us-east-1"]
    database_name           = "my-cluster-name"
    master_username         = "admin"
    master_password         = "blablablabla" #recomendado utilizar o resource random_string do Terraform
    backup_retention_period = 30
    preferred_backup_window = "07:00-09:00"

}

module "rds_cluster" {
    source = "path_to_module/terraform-aws-modules/rds/rds_cluster"

    cluster_identifier      = local.cluster_identifier
    engine                  = local.engine
    engine_version          = local.engine_version
    availability_zones      = local.availability_zones
    database_name           = local.database_name
    master_username         = local.master_username
    master_password         = local.master_password
    backup_retention_period = local.backup_retention_period
    preferred_backup_window = local.preferred_backup_window
    
}