variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "VPC ID (Will be created if not provided)"
  type        = string
  default     = ""  # Ensures Terraform does NOT prompt for input
}
