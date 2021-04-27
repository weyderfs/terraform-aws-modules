output "id"    {
    description = "Cluster ID"
    value       = aws_elasticache_cluster.redis.cluster_id
}

output "engine" {
    description = "Engine Type"
    value       = aws_elasticache_cluster.redis.engine
}

output "port" {
    description = "Redis Port"
    value       = aws_elasticache_cluster.redis.port
}
