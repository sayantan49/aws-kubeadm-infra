resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "k8s-vpc"
  }
}

resource "aws_subnet" "public" {
  count = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone = element(["eu-north-1a", "eu-north-1b"], count.index)

  tags = {
    Name = "public-subnet-${count.index}"
  }
}
