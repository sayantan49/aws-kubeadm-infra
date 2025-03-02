terraform {
  backend "s3" {
    bucket  = "terraform-state-sayantan"
    key     = "terraform.tfstate"
    region  = "eu-north-1"
    encrypt = true
  }
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "security_groups" {
  source     = "../../modules/security_groups"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "ec2" {
  source            = "../../modules/ec2"
  security_group_id = module.security_groups.k8s_master_id
  depends_on        = [module.security_groups]
}
