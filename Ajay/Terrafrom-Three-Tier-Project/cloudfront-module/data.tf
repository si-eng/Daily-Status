data "aws_lb" "test" {
  filter {
    name   = "tag:my-ALB"
  value = aws_lb.alb.dns_name
}
}