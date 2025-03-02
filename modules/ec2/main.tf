resource "aws_instance" "" {
  ami           = "ami-09a9858973b288bdd" # Change this to a valid AMI
  instance_type = "t3.medium"
  vpc_security_group_ids = [var.security_group_id]

  depends_on = [var.security_group_id]  # Ensures Security Group is created first

  tags = {
    Name = "k8s-ec2"
  }
}
