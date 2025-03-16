output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "security_group_master_id" {
  value = module.security_groups.master_id
}

output "security_group_worker_id" {
  value = module.security_groups.worker_id
}

output "ssh_key_name" {
  value = module.ssh_key.ssh_key_name
}

#output "instance_ids" {
  #value = module.ec2.instance_ids
#}
