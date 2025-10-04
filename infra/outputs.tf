output "s3_bucket_name" {
  value       = aws_s3_bucket.jenkins_bucket.bucket
  description = "Artifact bucket"
}

output "eks_cluster_name" {
  value       = module.eks.cluster_name
  description = "EKS name"
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "API server endpoint"
}

output "eks_cluster_certificate_authority" {
  value       = module.eks.cluster_certificate_authority_data
  description = "Base64 CA"
}
