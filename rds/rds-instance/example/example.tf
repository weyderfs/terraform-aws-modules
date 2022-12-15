locals  {

    allocated_storage               = "100"
    availability_zone               = "us-east-1"
    backup_retention_period         = 90
    backup_window                   = "09:46-10:16"
    delete_automated_backups        = true
    deletion_protection             = true
    enabled_cloudwatch_logs_exports = ["postgresql"]
    engine                          = "postgres"
    engine_version                  = "11.6"
    instance_class                  = "db.t2.micro"
    license_model                   = "postgresql-license"
    name                            = "data-airflow"
    option_group_name               = "default:postgres-11"
    parameter_group_name            = "default:postgres-11"
    password                        = "blablabla"
    performance_insights_enabled    = false
    port                            = 5432
    storage_encrypted               = false
    storage_type                    = "gp2"
    username                        = "admin"
    vpc_security_group_ids          = ["sg-XXxxxxxxXxxx"]

}

module "rds_instance" {
    source = "../../../../../../terraform-aws-modules/rds/rds_instance"
    
    allocated_storage                   = local.allocated_storage
    availability_zone                   = local.availability_zone
    backup_retention_period             = local.backup_retention_period
    backup_window                       = local.backup_window
    delete_automated_backups            = local.delete_automated_backups
    deletion_protection                 = local.deletion_protection
    enabled_cloudwatch_logs_exports     = local.enabled_cloudwatch_logs_exports
    engine                              = local.engine
    engine_version                      = local.engine_version
    instance_class                      = local.instance_class
    license_model                       = local.license_model
    name                                = local.name
    option_group_name                   = local.option_group_name
    parameter_group_name                = local.parameter_group_name
    password                            = local.password
    performance_insights_enabled        = local.performance_insights_enabled
    port                                = local.port
    storage_encrypted                   = local.storage_encrypted
    storage_type                        = local.storage_type
    username                            = local.username
    vpc_security_group_ids              = local.vpc_security_group_ids

}