resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public.id]
  subnets            = ["${aws_subnet.terrapublicpublic.id}", "${aws_subnet.terraprivate.id}"]

}

resource "aws_lb_target_group" "tg-group" {
  name        = "tg-group"
  port        = "8000"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  target_type = "ip"

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