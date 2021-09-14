output "endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "id" {
  value = aws_eks_cluster.cluster.id
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}