output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = data.aws_eks_cluster.current.endpoint
}

output "cluster_ca" {
  description = "Base64-encoded CA certificate for the cluster"
  value       = data.aws_eks_cluster.current.certificate_authority[0].data
}
