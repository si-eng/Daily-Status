# ECR REPOSITORY
resource "aws_ecrpublic_repository" "nandan1"  {
  repository_name = "ecr-repo003"
}

# ECS CLUSTER
resource "aws_ecs_cluster" "ecscluster1" {
  name = "clusternandan"
}

# TASK DEFINITION
resource "aws_ecs_task_definition" "task1" {
  family                   = "HTTPserver"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "nandan-container"
      image  = aws_ecrpublic_repository.nandan1.repository_uri #URI
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 80
        }
      ]
    }
  ])
}

# ECS SERVICE
resource "aws_ecs_service" "svc" {
  name            = "nandan-Service"
  cluster         = aws_ecs_cluster.ecscluster1.id
  task_definition = aws_ecs_task_definition.task1.id
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = [aws_subnet.seasiasubnet1.id, aws_subnet.seasiasubnet2.id]
    security_groups  = [aws_security_group.seasiasecuritygroup.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg-group.arn
    container_name   = "nandan-container"
    container_port   = 80
  }
}
