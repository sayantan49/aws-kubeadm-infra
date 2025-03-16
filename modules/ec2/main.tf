resource "aws_instance" "k8s_master" {
  ami           = var.ami_id
  instance_type = "t3.medium"
  subnet_id     = element(var.subnet_ids, 0)
  security_groups = [var.security_group_master_id]
  key_name      = var.ssh_key_name

  tags = {
    Name  = "k8s-master"
    Role  = "master"
    Owner = "terraform"
  }
}

resource "aws_instance" "k8s_workers" {
  count         = 2
  ami           = var.ami_id
  instance_type = "t3.medium"
  subnet_id     = element(var.subnet_ids, count.index + 1)
  security_groups = [var.security_group_worker_id]
  key_name      = var.ssh_key_name

  tags = {
    Name  = "k8s-worker-${count.index + 1}"
    Role  = "worker"
    Owner = "terraform"
  }
}
