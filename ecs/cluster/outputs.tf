
output "cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.this.arn
}

output "cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.this.name
}
