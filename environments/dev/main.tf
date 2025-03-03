terraform {
  #backend "s3" {
  # bucket         = "terraform-state-sayantan"
  #key            = "terraform.tfstate"
  #region         = "eu-north-1"
  #}
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "security_groups" {
  source     = "../../modules/security_groups"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "ec2" {
  source             = "../../modules/ec2"
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  subnet_ids         = module.vpc.subnet_ids
  security_group_ids = [module.security_groups.sg_id]
  depends_on         = [module.vpc, module.security_groups]
}
