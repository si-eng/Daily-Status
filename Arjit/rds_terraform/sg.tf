resource "aws_security_group" "rds-sg" {
  name   = "my-rds-sg"
  vpc_id = "vpc-09fb31d1b55fceb2c"

}


resource "aws_security_group_rule" "mysql_inbound_access" {
  from_port         = 3306
  protocol          = "tcp"
  security_group_id = "${aws_security_group.rds-sg.id}"
  to_port           = 3306
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]

  
}