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
  vpc_id   = aws_vpc.terraform.id
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.host.id
  port             = 80
}