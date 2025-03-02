resource "aws_security_group" "k8s_master" {
  name_prefix = "k8s-master"
  vpc_id = "aws_vpc.main.id"

  ingress {
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name= "k8s-master-sg"
  }
}

resource "aws_security_group" "k8s_worker" {
  name_prefix = "k8s-worker"
  vpc_id = "aws_vpc.main.id"

  ingress {
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name= "k8s-worker-sg"
  }
}