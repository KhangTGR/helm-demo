output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "Jenkin-private-kp" {
  description = "Key-pair for Jenkin Server"
  value       = module.key_pair.private_key_pem
  sensitive   = true
}

output "Jenkin-public-kp" {
  description = "Key-pair for Jenkin Server"
  value       = module.key_pair.public_key_pem
}