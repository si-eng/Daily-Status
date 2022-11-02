
# Creating VPC 
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "terraform-vpc"
  }
}

#public subnet
resource "aws_subnet" "terrapublicpublic" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "terra-publicSubnet"
  }
}

#private subnet
resource "aws_subnet" "terraprivate" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "terra-PrivateSubnet"
  }
}

#route table
resource "aws_route_table" "terrapublic" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraInternetGateway.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

#associating subnets to route table
resource "aws_route_table_association" "forPublic" {
  subnet_id      = aws_subnet.terrapublicpublic.id
  route_table_id = aws_route_table.terrapublic.id
}
resource "aws_route_table_association" "forPrivate" {
  subnet_id      = aws_subnet.terraprivate.id
  route_table_id = aws_route_table.terrapublic.id
}

#internetgateway
resource "aws_internet_gateway" "terraInternetGateway" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "terrainternetgw"
  }
}