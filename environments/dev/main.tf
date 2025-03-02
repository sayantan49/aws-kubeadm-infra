provider "aws" {
  region      = "eu-north-1"
  retry_mode  = "adaptive"
  max_retries = 5
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}

module "vpc" {
  source = "../../modules/vpc"
}

module "security_groups" {
  source     = "../../modules/security_groups"
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]
}

module "ec2" {
  source       = "../../modules/ec2"
  vpc_id       = module.vpc.vpc_id
  master_sg_id = module.security_groups.master_sg_id
  worker_sg_id = module.security_groups.worker_sg_id
  depends_on   = [module.vpc, module.security_groups]
}
