#ECR repository


resource "aws_ecrpublic_repository" "demo"  {
  repository_name = "ecr-23"
}


# ECS Cluster

resource "aws_ecs_cluster" "ecs-cluster2022" {
  name = "clusterDev"
}

# task desfination


resource "aws_ecs_task_definition" "task" {
  family                   = "HTTPserver"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "golang-container"
      image  = aws_ecrpublic_repository.foo.repository_uri #URI
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


# Ecs service


resource "aws_ecs_service" "svc" {
  name            = "golang-Service"
  cluster         = "${aws_ecs_cluster.ecs-cluster2022.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}"]
    security_groups  = ["${aws_security_group.sg1.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
    container_name   = "golang-container"
    container_port   = "8000"
  }
}
