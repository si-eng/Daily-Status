resource "aws_lb" "abclb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.securitygroup.id]
  subnets            = [aws_subnet.publicsubnet.id,aws_subnet.privatesubnet.id]


  access_logs {
    bucket  = aws_s3_bucket.s3test.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

# Creating target group

resource "aws_lb_target_group" "targetgrp" {
  name     = "testargetgp-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpcmain.id

}

resource "aws_lb_target_group_attachment" "testtg1" {
  target_group_arn = aws_lb_target_group.targetgrp.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "testtg2" {
  target_group_arn = aws_lb_target_group.targetgrp.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

# creating listner group 

resource "aws_lb_listener" "testlistener" {
  load_balancer_arn = aws_lb.abclb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgrp.arn
  }
}