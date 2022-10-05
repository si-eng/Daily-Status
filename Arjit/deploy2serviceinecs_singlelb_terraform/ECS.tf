# ECS CLUSTER

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "clusterDev"
}

# TASK DEFINITION 1 (django)
resource "aws_ecs_task_definition" "task" {
  family                   = "task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "django-container"
      image  = "839353020711.dkr.ecr.us-east-1.amazonaws.com/retest:latest" 
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 8000
        }
      ]
    }
  ])
}
# ECS SERVICE 1 (django)
resource "aws_ecs_service" "svc" {
  name            = "django-Service"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg1.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
    container_name   = "django-container"
    container_port   = "8000"
  }
}



# TASK DEFINITION 2 (react)
resource "aws_ecs_task_definition" "task1" {
  family                   = "task1"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "react-container"
      image  = "839353020711.dkr.ecr.us-east-1.amazonaws.com/htech:latest" 
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 3000
        }
      ]
    }
  ])
}
# ECS SERVICE 2 (react)
resource "aws_ecs_service" "svc1" {
  name            = "react-Service"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task1.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg1-group.arn}"
    container_name   = "react-container"
    container_port   = "3000"
  }
}