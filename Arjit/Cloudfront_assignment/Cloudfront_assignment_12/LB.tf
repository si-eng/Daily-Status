resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_terraform_grp.id]
  subnets            = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]

}

resource "aws_lb_target_group" "tg-group" {
  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }
  name     = "tg-group"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.createVPC.id
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = aws_lb_target_group.tg-group.arn
  target_id        = aws_instance.cicd-terraform.id
  port             = 8000
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = "${aws_lb.app-lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
  }
}