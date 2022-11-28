resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]

}

resource "aws_lb_target_group" "tg-group" {     
  name        = "tg-group"
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
        arn = aws_lb_target_group.tg-group.arn
      }     
    }
  }
}
##############################################################################################################3
resource "aws_lb_target_group" "tg1-group" {     
  name        = "tg1-group"
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
    target_group_arn = aws_lb_target_group.tg1-group.arn
  }



 condition {
    path_pattern {
      values = ["/index2.html"]
    }
  }

 condition {
    query_string {
      key   = "health"
      value = "check"
    }
  }
}

##############################################################################################################3
resource "aws_lb_target_group" "tg2-group" {     
  name        = "tg2-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"


}


resource "aws_lb_listener_rule" "static2" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 101



 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2-group.arn
  }



 condition {
    path_pattern {
      values = ["/index3.html"]
    }
  }

 condition {
    query_string {
      key   = "check"
      value = "health"
    }
  }
}

##############################################################################################################3
resource "aws_lb_target_group" "tg3-group" {     
  name        = "tg3-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"


}


resource "aws_lb_listener_rule" "static3" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 102



 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg3-group.arn
  }



 condition {
    path_pattern {
      values = ["/index4.html"]
    }
  }

 condition {
    query_string {
      key   = "my"
      value = "site"
    }
  }
}

##############################################################################################################3
resource "aws_lb_target_group" "tg4-group" {     
  name        = "tg4-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"


}


resource "aws_lb_listener_rule" "static4" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 104



 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg4-group.arn
  }



 condition {
    path_pattern {
      values = ["/index5.html"]
    }
  }

 condition {
    query_string {
      key   = "site"
      value = "my"
    }
  }
}

##############################################################################################################3
resource "aws_lb_target_group" "tg5-group" {     
  name        = "tg5-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.createVPC.id}"
  target_type = "ip"
}

resource "aws_lb_listener_rule" "static5" {
  listener_arn = aws_lb_listener.lb-listener.arn
  priority     = 106



 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg5-group.arn
  }



 condition {
    path_pattern {
      values = ["/index6.html"]
    }
  }

 condition {
    query_string {
      key   = "html"
      value = "server"
    }
  }
}
