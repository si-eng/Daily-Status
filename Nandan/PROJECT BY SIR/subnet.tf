resource "aws_subnet" "seasiasubnet1" {
  vpc_id     = aws_vpc.seasiavpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "seasiasubnet1"
  }
}

resource "aws_subnet" "seasiasubnet2" {
  vpc_id = aws_vpc.seasiavpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    "Name" = "seasiasubnet2"
  }
} 