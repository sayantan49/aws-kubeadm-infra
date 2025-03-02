resource "aws_instance" "ec2_instance" {
  ami           = "ami-0912084d6d35eb634" # Change this to a valid AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]

  depends_on = [var.security_group_id]  # Ensures Security Group is created first

  tags = {
    Name = "k8s-ec2"
  }
}
