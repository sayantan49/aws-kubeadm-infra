output "security_group_master_id" {
  value = aws_security_group.k8s_master.id
}

output "security_group_worker_id" {
  value = aws_security_group.k8s_workers.id
}
