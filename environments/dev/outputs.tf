output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "security_group_id" {
  value = module.security_groups.sg_id
}

output "ec2_public_ips" {
  value = module.ec2.ec2_public_ips
}
