variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "ami_id" {
  default = "ami-09a9858973b288bdd" # Ubuntu AMI for eu-north-1
}
