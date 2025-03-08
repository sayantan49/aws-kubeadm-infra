provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "security_groups" {
  source     = "../../modules/security_groups"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "iam" {
  source = "../../modules/iam"
}

module "s3" {
  source = "../../modules/s3"
}


