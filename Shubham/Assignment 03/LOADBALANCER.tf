resource "aws_lb" "test" {
  name               = "Mylb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow.id]
  subnets            = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id ]

  enable_deletion_protection = false

  tags = {
    Name = "Mylb"
  }
}

resource "aws_lb_listener" "LG" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}

resource "aws_lb_target_group" "TG" {
  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }
  name     = "TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.shubvpc.id
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.host.id
  port             = 80
}