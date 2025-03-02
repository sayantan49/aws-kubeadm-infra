provider "aws" {

  region = "eu-north-1"

}

module "vpc" {
  source = "../../modules/vpc"
}

module "security_groups" {
  source = "../../modules/security_groups"
  vpc_id = module.vpc.vpc_id
}




module "ec2" {
  source        = "../../modules/ec2"
  vpc_id        = module.vpc.vpc_id
  master_sg_id  = module.security_groups.master_sg_id
  worker_sg_id  = module.security_groups.worker_sg_id
}
