resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main-vpc"
  }
}

#output "vpc_id" {
 # value = aws_vpc.main.id
#}
