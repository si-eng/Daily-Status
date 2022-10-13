resource "aws_db_instance" "my_test_mysql" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0.28"
  instance_class              = "db.t2.micro"
  name                        = "myrdstestmysql"
  username                    = "admin"
  password                    = "admin123"
  
  db_subnet_group_name        = "${aws_db_subnet_group.rds-private-subnet.name}"
  vpc_security_group_ids      = ["${aws_security_group.rds-sg.id}"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  publicly_accessible    = true
  
  
  multi_az                    = false
  skip_final_snapshot         = true
}