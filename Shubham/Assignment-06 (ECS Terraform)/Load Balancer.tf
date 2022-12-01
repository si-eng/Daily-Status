resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]

}



resource "aws_lb_target_group" "tggroup0" {     
  name        = "tggroup0"
  port        = "80"
  protocol    = "HTTP"                                                
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

}



resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"
                                                                 
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.tggroup0.arn
      }

      
      

      
    }
  }
}




resource "aws_lb_target_group" "tggroup1" {     
  name        = "tggroup1"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

  

}
                                                                                  


resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tggroup1.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "health"
      value = "check"
    }
  }
}




resource "aws_lb_target_group" "tggroup2" {     
  name        = "tggroup2"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

  
}



resource "aws_lb_listener_rule" "static1" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tggroup2.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "ipl"
      value = "mi"
    }
  }
}




resource "aws_lb_target_group" "tggroup3" {     
  name        = "tggroup3"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

  

}




resource "aws_lb_listener_rule" "static2" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 98

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tggroup3.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "value"
      value = "service"
    }
  }
}



resource "aws_lb_target_group" "tggroup4" {     
  name        = "tggroup4"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

  

}


resource "aws_lb_listener_rule" "static3" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 97

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tggroup4.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "local"
      value = "host"
    }
  }
}




resource "aws_lb_target_group" "tggroup5" {     
  name        = "tggroup5"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"

  

}




resource "aws_lb_listener_rule" "static4" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 96

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tggroup5.arn
  }

  condition {
    path_pattern {
      values = ["/index.html"]
    }
  }

  condition {
    query_string {
      key   = "logic"
      value = "answer"
    }
  }
}


