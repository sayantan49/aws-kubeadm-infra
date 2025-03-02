output "master_public_ip" {
  value = aws_instance.master.id
}

output "worker_public_ip" {
  value = aws_instance.worker[*].id
}

