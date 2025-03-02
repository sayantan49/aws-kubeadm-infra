resource "aws_security_group" "k8s_master" {
  vpc_id = var.vpc_id

  depends_on = [var.vpc_id]  # Ensures VPC is created first

  tags = {
    Name = "k8s-master-sg"
  }
}

resource "aws_security_group" "k8s_worker" {
  vpc_id = var.vpc_id

  depends_on = [var.vpc_id]  # Ensures VPC is created first

  tags = {
    Name = "k8s-worker-sg"
  }
}
