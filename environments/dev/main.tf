module "vpc" {
  source = "../../modules/vpc"
}

module "s3" {
  source = "../../modules/s3"
}


module "security_groups" {
  source = "../../modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ssh_key" {
  source            = "../../modules/ssh_key"
  existing_key_name = "my-k8s-key"
  local_key_path    = "~/.ssh/id_rsa.pub"
}

/*module "vpc" {
  source = "../../modules/vpc"
}*/

/*module "ec2" {
  source                  = "../../modules/ec2"
  #vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
  security_group_master_id = module.security_groups.master_id
  security_group_worker_id = module.security_groups.worker_id
  ssh_key_name            = module.ssh_key.ssh_key_name
  ami_id                  = "ami-09a9858973b288bdd"  # Replace with a valid AMI ID
}
*/