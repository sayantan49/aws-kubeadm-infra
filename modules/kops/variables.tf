variable "s3_bucket" {
  description = "S3 bucket for Kops state store"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Kubernetes cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the Kubernetes cluster nodes"
  type        = list(string)
}

variable "ssh_key_path" {
  description = "Path to the SSH public key for Kops"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "k8s-cluster.k8s.local"
}

variable "zones" {
  description = "Availability zones for the Kubernetes cluster"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b"]
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "node_size" {
  description = "Instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "master_size" {
  description = "Instance type for master node"
  type        = string
  default     = "t3.medium"
}



