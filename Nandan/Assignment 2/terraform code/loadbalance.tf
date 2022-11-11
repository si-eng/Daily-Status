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

resource "aws_lb_target_group" "tg-group" {
  name        = "tg-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.seasiavpc.id}"
  target_type = "ip"
}