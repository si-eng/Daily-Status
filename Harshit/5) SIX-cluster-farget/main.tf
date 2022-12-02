################################################provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.51"
    }
  }
}

 provider "aws" {
  profile ="default"
  region  ="us-east-1"

}



#####################################################################################################

########################################     VPC                    
resource "aws_vpc" "ecs-vpc" {
  cidr_block = "${var.cidr}"

  tags = {
    Name = "ecs-vpc"
  }
}

################## PUBLIC SUBNETS

resource "aws_subnet" "pub-subnets" {
  count                   = length(var.azs)
  vpc_id                  = "${aws_vpc.ecs-vpc.id}"
  availability_zone       = "${var.azs[count.index]}"
  cidr_block              = "${var.subnets-ip[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnets"
  }
}


######################## $ INTERNET GATEWAY $

resource "aws_internet_gateway" "i-gateway" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"

  tags = {
    Name = "ecs-igtw"
  }
}

############################################################################################################################


############################ Routetable

resource "aws_route_table" "pub-table" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"
}

############################  Pub Route


resource "aws_route" "pub-route" {
  route_table_id         = "${aws_route_table.pub-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.i-gateway.id}"
}

#####################  Route association


resource "aws_route_table_association" "as-pub" {
  count          = length(var.azs)
  route_table_id = "${aws_route_table.pub-table.id}"
  subnet_id      = "${aws_subnet.pub-subnets[count.index].id}"
}



###################################################################################################################################





############################## SECURITY-GROUP FOR LOADBALANCER

resource "aws_security_group" "sg2" {
  name        = "golang-server-alb"
  description = "Port 80"
  vpc_id      = aws_vpc.ecs-vpc.id

  ingress {
    description      = "Allow Port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###################################################################################################################################





###########################Creating  APPLICATION LOADBALANCER

resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = ["${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}"]

}



resource "aws_lb_target_group" "tg-group-1" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}





resource "aws_lb_target_group" "tg-group-2" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}



resource "aws_lb_target_group" "tg-group-3" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}



resource "aws_lb_target_group" "tg-group-4" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}




resource "aws_lb_target_group" "tg-group-5" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}




resource "aws_lb_target_group" "tg-group-6" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
}

########################################### Listner group rule 

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = "${aws_lb.app-lb.arn}"
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-1.arn
}
}



#################################### Rules for first service 

resource "aws_lb_listener_rule" "rule-1" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 100
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-1.arn
  }

  condition {
    host_header {
      values = ["service-1.${var.dns}"]
    }
  }
}

#################################### Rules for second  service 

resource "aws_lb_listener_rule" "rule-2" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 97
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-2.arn
  }

  condition {
    host_header {
      values = ["service-2.${var.dns}"]
    }
  }
}

###################################### rule for third service 


resource "aws_lb_listener_rule" "rule-3" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 96
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-3.arn
  }

  condition {
    host_header {
      values = ["service-3.${var.dns}"]
    }
  }
}

################################## Rule for forth service 

resource "aws_lb_listener_rule" "rule-4" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 96
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-4.arn
  }

  condition {
    host_header {
      values = ["service-4.${var.dns}"]
    }
  }
}

######################################## Rule for fifth service 


resource "aws_lb_listener_rule" "rule-5" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 95
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-5.arn
  }

  condition {
    host_header {
      values = ["service-5.${var.dns}"]
    }
  }
}

######################################## Rule for sexth service 


resource "aws_lb_listener_rule" "rule-6" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 94
  
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-group-6.arn
  }

  condition {
    host_header {
      values = ["service-6.${var.dns}"]
    }
  }
}


 
 




###################################################################################################################################
# S3 BUCKET FOR ARTIFACTORY_STORE
resource "aws_s3_bucket" "bucketbucket" {
  bucket = "erosdfasdkhfaksdasksdfhk123"
  acl    = "private"
}

######################################################################### CODE COMMIT

resource "aws_codecommit_repository" "commit-repo" {
  repository_name = var.repo_name
}

resource "aws_codebuild_project" "repo-project-main" {
  name         = "${var.build_project}"
  service_role = "${aws_iam_role.codebuild-role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  source {
    type     = "CODECOMMIT"
    location = "${aws_codecommit_repository.commit-repo.clone_url_http}"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }
}



########################################################   ECR-cluster 

resource "aws_ecs_cluster" "ecs-cluster-main" {
  name = var.ecs_cluster
}