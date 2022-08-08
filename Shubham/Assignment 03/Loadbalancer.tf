resource "aws_lb" "test" {
  name               = "Mylb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow.id]
  subnets            = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id ]

  enable_deletion_protection = false

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Name = "Mylb"
  }
}
