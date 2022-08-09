resource "aws_lb" "SEASIALB" {
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