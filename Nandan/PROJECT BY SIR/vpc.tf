resource "aws_vpc" "seasiavpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "projectseasiavpc"
  }
}

resource "aws_internet_gateway" "seasiaigw" {
  vpc_id = aws_vpc.seasiavpc.id

  tags = {
    Name = "gateway"
  }
}


resource "aws_route_table" "seasiarouttable" {
  vpc_id = aws_vpc.seasiavpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.seasiaigw.id
  }

  tags = {
    Name = "seasiaroutetable"
  }
}

resource "aws_route" "seasiaroutes" {
  route_table_id            = aws_route_table.seasiarouttable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.seasiaigw.id
  
}



resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.seasiasubnet1.id
  route_table_id = aws_route_table.seasiarouttable.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.seasiasubnet2.id
  route_table_id = aws_route_table.seasiarouttable.id
}