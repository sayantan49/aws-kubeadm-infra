resource "aws_instance" "ec2_instance" {
  count         = 3
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name: count.index == 0 ? "k8s-master" : "k8s-worker-${count.index}"
  }
}
