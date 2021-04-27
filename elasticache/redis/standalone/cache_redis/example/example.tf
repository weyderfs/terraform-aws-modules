locals  {
    
    cluster_id                      = "MyRedis"
    engine                          = "redis"
    engine_version                  = "5.0.6"
    maintenance_window              = "sun:08:30-sun:09:30"
    node_type                       = "cache.t2.small"
    num_cache_nodes                 = 1
    number_cache_clusters           = 2
    parameter_group_name            = "default.redis5.0"
    port                            = 6379
    security_group_ids              = ["sg-xxxxxxxxxxxx, sg-xxxxxxxxxxxx"]
    subnet_group_name               = "MyRedis"
    automatic_failover_enabled      = true
    availability_zones              = ["us-east-1b"]
    replication_group_id            = "MyRedis"
    replication_group_description   = "NP Cache Payland Replication Group"

}

module "cache_redis" {
    source = "../../../../../../terraform-aws-modules/elasticache/cache_redis"
    
    cluster_id                      = local.cluster_id
    engine                          = local.engine
    engine_version                  = local.engine_version
    maintenance_window              = local.maintenance_window
    security_group_ids              = local.security_group_ids
    subnet_group_name               = local.subnet_group_name
    num_cache_nodes                 = local.num_cache_nodes

}

module "replication_group" {
    source = "path_to_module/terraform-aws-modules/elasticache/replication_group"

    automatic_failover_enabled    = local.automatic_failover_enabled
    availability_zones            = local.availability_zones
    replication_group_id          = local.replication_group_id
    replication_group_description = local.replication_group_description
    node_type                     = local.node_type
    number_cache_clusters         = local.number_cache_clusters
    parameter_group_name          = local.parameter_group_name
    port                          = local.port
    
}