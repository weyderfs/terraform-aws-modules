
output "cache_nodes" {
    description = "List of node objects including id, address, port and availability_zone."
    value       = aws_elasticache_cluster.memcached.cache_nodes

}
    

output "configuration_endpoint" {
    description = "(Memcached only) The configuration endpoint to allow host discovery."
    value       = aws_elasticache_cluster.memcached.configuration_endpoint
} 

output "cluster_address"    {
    description = "(Memcached only) The DNS name of the cache cluster without the port appended."
    value       = aws_elasticache_cluster.memcached.cluster_address
}
