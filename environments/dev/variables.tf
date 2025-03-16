variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = []
}


variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-09a9858973b288bdd"
}
