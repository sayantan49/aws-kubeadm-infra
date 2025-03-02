output "k8s_master_id" {
  value = aws_security_group.k8s_master.id
}

output "k8s_worker_id" {
  value = aws_security_group.k8s_worker.id
}
