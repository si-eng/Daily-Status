
resource "aws_lb" "server1" {
  name               = "Terra"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public.id]
  subnets            = [aws_subnet.private.id, aws_subnet.public.id ]
  enable_deletion_protection = false
  tags = {
    Name = "Terra"
  }
}
#TARGET GROUP  
resource "aws_lb_target_group" "tg_terraform987" {
  name     = "terra-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.server1.id
}
# lISTNER
resource "aws_lb_listener" "LG" {
  load_balancer_arn = aws_lb.server1.arn
  port              = "80"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_terraform987.arn
  }
}
#target group attachment with ec2 instances
resource "aws_lb_target_group_attachment" "tg-1" {
    target_group_arn = aws_lb_target_group.tg_terraform987.arn 
    target_id = aws_instance.ins1.id
    port = 80

}

resource "aws_lb_target_group_attachment" "tg-2" {
    target_group_arn = aws_lb_target_group.tg_terraform987.arn
    target_id = aws_instance.ins2.id
    port = 80

}