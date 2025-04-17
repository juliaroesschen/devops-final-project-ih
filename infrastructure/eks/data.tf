# Fetch details about your existing cluster
data "aws_eks_cluster" "current" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "current" {
  name = var.cluster_name
}
