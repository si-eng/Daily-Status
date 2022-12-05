resource "aws_lb" "abdloadbalancer" {
  name               = "test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.securitygroup.id]
  subnets            = [aws_subnet.publicsubnet.id,aws_subnet.privatesubnet.id]


  access_logs {
    bucket  = aws_s3_bucket.testdemobucket.bucket
    prefix  = "test-alb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

# Creating target group

resource "aws_lb_target_group" "testtargetgrp" {
  name     = "testargetgp-tgp"
  port     = 80
  target_type = "ip"
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpcmain.id

}



# creating listner group 

resource "aws_lb_listener" "testlistener" {
  load_balancer_arn = aws_lb.abdloadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testtargetgrp.arn
  }
}