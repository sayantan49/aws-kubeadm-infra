variable "instance_type" {
  description = "Instance type for kubernetes nodes"
  type        = string
  default     = "t3.medium"

}

variable "master_sg_id" {
  description = "Security group ID for Kubernetes master node"
  type        = string
}

variable "worker_sg_id" {
  description = "Security group ID for Kubernetes worker nodes"
  type        = string
}

variable "vpc_id" {
  type = string
}
