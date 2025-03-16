variable "existing_key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
  default     = "my-k8s-key"
}

variable "local_key_path" {
  description = "Path to the local SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
