resource "tls_private_key" "k8s_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.k8s_key.private_key_pem
  filename = "~/.ssh/id_rsa"
}

resource "local_file" "public_key" {
  content  = tls_private_key.k8s_key.public_key_openssh
  filename = "~/.ssh/id_rsa.pub"
}

resource "aws_key_pair" "k8s_key" {
  key_name   = "k8s-key"
  public_key = tls_private_key.k8s_key.public_key_openssh
}

output "ssh_key_name" {
  value = aws_key_pair.k8s_key.key_name
}
