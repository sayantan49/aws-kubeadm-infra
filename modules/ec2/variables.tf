variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-09a9858973b288bdd"  # Replace with your correct AMI ID
}



variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t3.medium"
}

module "vpc" {
  source = "../../modules/vpc"
}


variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}


variable "security_group_master_id" {
  description = "Security group ID for the master node"
  type        = string
}

variable "security_group_worker_id" {
  description = "Security group ID for the worker nodes"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH Key Name for EC2 instances"
  type        = string
}
