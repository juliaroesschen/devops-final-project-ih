variable "aws_region" {
  description = "AWS region of the existing EKS cluster"
  type        = string
  default     = "ap-northeast-3"
}

variable "cluster_name" {
  description = "Name of the existing EKS cluster"
  type        = string
  default     = "my-eks-prod"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster lives"
  type        = string
  default     = "vpc-043960a45ee94b3a1"
}
