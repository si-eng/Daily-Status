resource "aws_lb_target_group" "seasiatargetgroup" {
  name     = "seasia-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.seasiavpc.id
}

resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.seasiatargetgroup.arn
  target_id        = aws_instance.server1.id
  port             = 80
 
}

resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.seasiatargetgroup.arn
  target_id        = aws_instance.server2.id
  port             = 80
  
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.seasialb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.seasiatargetgroup.arn
  }
}  