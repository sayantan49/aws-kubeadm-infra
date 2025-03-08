variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04 in eu-north-1"
  type        = string
  default     = "ami-046e1066fa018bc1a"
}
