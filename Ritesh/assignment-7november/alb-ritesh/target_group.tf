######################################################
## Instance Target Group
######################################################

resource "aws_lb_target_group" "alb_target_group" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = data.aws_vpc.vpc_selected.id
  
  tags = {
    "Name" = "tg"
  }
}