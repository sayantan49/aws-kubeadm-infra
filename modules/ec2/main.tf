resource "aws_instance" "master" {

  ami                    = "ami-09a9858973b288bdd"
  instance_type          = "t3.medium"
  vpc_security_group_ids = [var.master_sg_id]
  depends_on = [var.vpc_id, var.master_sg_id]
  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "worker" {

  count                  = 2
  ami                    = "ami-09a9858973b288bdd"
  instance_type          = "t3.medium"
  vpc_security_group_ids = [var.worker_sg_id]
  depends_on = [var.vpc_id, var.worker_sg_id]
  tags = {
    Name = "k8s-worker-${count.index}"
  }

}