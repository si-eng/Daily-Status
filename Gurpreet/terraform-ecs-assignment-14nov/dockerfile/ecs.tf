resource "aws_ecs_service" "ecsservicetest" {
  name            = "test-Service"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.privatesubnet.id}", "${aws_subnet.publicsubnet.id}"]
    security_groups  = ["${aws_security_group.securitygroup.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.testtargetgrp.arn}"
    container_name   = "test-container"
    container_port   = "80"
  }
}