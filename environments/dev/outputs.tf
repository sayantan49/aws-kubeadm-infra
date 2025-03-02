output "vpc_id" {
  value = module.vpc.vpc_id
}

output "master_public_ip" {
  value = module.ec2.master_public_ip
}

output "worker_public_ips" {
  value = module.ec2.worker_public_ip
}
