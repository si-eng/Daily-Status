 #creating application load balancer
resource "aws_lb" "service-lb" {
    name = "service-lb"
    load_balancer_type = "application"
    internal = false
    enable_deletion_protection = false
    security_groups = [aws_security_group.sg.id]
    subnets = [aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id]
}
#creating target group
resource "aws_lb_target_group" "service-tg" {
    name = "service-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.myVPC.id
}
#creating listener group
resource "aws_lb_listener" "service-listener" {
    load_balancer_arn = aws_lb.service-lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.service-tg.arn
    }
}
#target group attachment with ec2 instances
resource "aws_lb_target_group_attachment" "tg-1" {
    target_group_arn = aws_lb_target_group.service-tg.arn
    target_id = aws_instance.service-instance.id
    port = 80
}