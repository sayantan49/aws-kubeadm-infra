variable "ssh_key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "my-k8s-key"
}


data "aws_key_pair" "existing_key" {
  key_name = var.existing_key_name
}

/*resource "aws_key_pair" "imported_key" {
  key_name   = var.existing_key_name
  public_key = file(var.local_key_path)
}*/

output "ssh_key_name" {
  value = data.aws_key_pair.existing_key.key_name
}

