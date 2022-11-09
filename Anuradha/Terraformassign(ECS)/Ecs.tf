# ECS CLUSTER

resource "aws_ecs_cluster" "ecscluster" {
  name = "clusterDev"
}

# TASK DEFINITION
resource "aws_ecs_task_definition" "task" {
  family                   = "task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "ecscontainer"
      image  = "839353020711.dkr.ecr.us-east-1.amazonaws.com/ecscontainer" 
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


resource "aws_ecs_service" "svc" {
  name            = "react-Service"
  cluster         = "${aws_ecs_cluster.ecscluster.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.terrapublicpublic.id}", "${aws_subnet.terraprivate.id}"]
    security_groups  = ["${aws_security_group.public.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
    container_name   = "ecscontainer"
    container_port   = "8000"
  }
}