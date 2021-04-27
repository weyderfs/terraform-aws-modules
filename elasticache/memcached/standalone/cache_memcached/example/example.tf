locals  {
    
    cluster_id                      = "MyMemcached"
    engine                          = "memcached"
    engine_version                  = "1.5.16"
    maintenance_window              = "sun:08:30-sun:09:30"
    node_type                       = ""
    notification_topic_arn          = ""
    num_cache_nodes                 = "1"
    parameter_group_name            = "default.memcached1.5"
    port                            = 11211
    security_group_ids              = ["${data.aws_security_group.sg.id}"]
    subnet_group_name               = "default"

}

module "cache_memcached" {
    source = "path_to_module/terraform-aws-modules/cache_memcached"
    
    cluster_id                      = local.cluster_id
    engine                          = local.engine
    engine_version                  = local.engine_version
    maintenance_window              = local.maintenance_window
    node_type                       = local.node_type
    notification_topic_arn          = local.notification_topic_arn
    num_cache_nodes                 = local.num_cache_nodes
    parameter_group_name            = local.parameter_group_name
    port                            = local.port
    security_group_ids              = local.security_group_ids
    subnet_group_name               = local.subnet_group_name
   
}

data "aws_security_group" "sg" {
  vpc_id = "vpc-xxxxxxxx"
  name = "default"
}