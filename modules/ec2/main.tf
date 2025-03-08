resource "aws_instance" "k8s_master" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]
  vpc_security_group_ids = [var.security_group_master_id]
  key_name = var.ssh_key_name

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "k8s_workers" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index + 1]
  vpc_security_group_ids = [var.security_group_worker_id]
  key_name = var.ssh_key_name

  tags = {
    Name = "k8s-worker-${count.index}"
  }
}
