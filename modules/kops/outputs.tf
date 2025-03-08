output "cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = var.cluster_name
}

output "kops_state_store" {
  description = "The S3 bucket where Kops state is stored"
  value       = "s3://${var.s3_bucket}"
}

output "vpc_id" {
  description = "VPC ID used for the cluster"
  value       = var.vpc_id
}

output "subnet_ids" {
  description = "Subnet IDs used for the cluster"
  value       = var.subnet_ids
}
