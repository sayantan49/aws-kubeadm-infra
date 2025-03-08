output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = module.vpc.subnet_ids
}

output "security_group_master_id" {
  description = "Security Group ID for master node"
  value       = module.security_groups.security_group_master_id
}

output "security_group_worker_id" {
  description = "Security Group ID for worker nodes"
  value       = module.security_groups.security_group_worker_id
}

output "iam_role_name" {
  description = "IAM Role for Kops"
  value       = module.iam.iam_role_name
}

output "s3_bucket_name" {
  description = "S3 Bucket for Kops State Store"
  value       = module.s3.bucket_name
}
