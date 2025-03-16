output "instance_ids" {
  value = concat([aws_instance.k8s_master.id], aws_instance.k8s_workers[*].id)
}
