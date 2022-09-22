resource "aws_lb" "applicatin-test" {
  name               = "lb-tf-terraform"
  internal           = false
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  security_groups = [aws_security_group.security_terraform_grp.id]
  subnets            = data.aws_subnet_ids.subnet.ids
  enable_http2       = false

  tags = {
    Environment = "production"
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
  vpc_id   = aws_default_vpc.default.id
  
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.applicatin-test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}


resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.test-terraform.id
  port             = 80
}