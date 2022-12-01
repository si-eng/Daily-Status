#vpc#
resource "aws_vpc" "seasiavpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "projectseasiavpc"
  }
}

resource "aws_subnet" "seasiasubnet1" {
  vpc_id     = aws_vpc.seasiavpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "seasiasubnet1"
  }
}

resource "aws_subnet" "seasiasubnet2" {
  vpc_id = aws_vpc.seasiavpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "seasiasubnet2"
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


#load balancer#

resource "aws_lb" "seasialb" {
  name               = "seasiaLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.seasiasecuritygroup.id]
  subnets            = [aws_subnet.seasiasubnet1.id, aws_subnet.seasiasubnet2.id ]
  enable_deletion_protection = false

  tags = {
    Name = "SEASIALB"
  }
}



resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = "${aws_lb.seasialb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check1"
    }
  }
}

resource "aws_lb_listener_rule" "static1" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check2"
    }
  }
}

resource "aws_lb_listener_rule" "static2" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 98

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check3"
    }
  }
}

resource "aws_lb_listener_rule" "static3" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 97

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg3-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check4"
    }
  }
}

resource "aws_lb_listener_rule" "static4" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 96

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg4-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check5"
    }
  }
}

resource "aws_lb_listener_rule" "static5" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 80

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg5-group.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check6"
    }
  }
}

resource "aws_lb_target_group" "tg-group" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}

resource "aws_lb_target_group" "tg1-group" {
  name        = "tg1-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}
resource "aws_lb_target_group" "tg2-group" {
  name        = "tg2-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}
resource "aws_lb_target_group" "tg3-group" {
  name        = "tg3-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}
resource "aws_lb_target_group" "tg4-group" {
  name        = "tg4-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}
resource "aws_lb_target_group" "tg5-group" {
  name        = "tg5-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}

#security group#

resource "aws_security_group" "seasiasecuritygroup" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.seasiavpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "seasiasecuritygroup"
  }
}
#ecs cluster#
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "clusterDev"
}

# ECR REPOSITORY
resource "aws_ecrpublic_repository" "ecr1" {

  repository_name = "ecr-1"
}

resource "aws_ecrpublic_repository" "ecr2" {

  repository_name = "ecr-2"
}

resource "aws_ecrpublic_repository" "ecr3" {

  repository_name = "ecr-3"
}

resource "aws_ecrpublic_repository" "ecr4" {

  repository_name = "ecr-4"
}

resource "aws_ecrpublic_repository" "ecr5" {

  repository_name = "ecr-5"
}

resource "aws_ecrpublic_repository" "ecr6" {

  repository_name = "ecr-6"
}

#S3 BUCKET# 
resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "nhnbgvfdds6333"
  force_destroy = true  
  acl    = "private"

  tags = {
    Name        = "Myterraformbucket"
  }  
}