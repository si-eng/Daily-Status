# Creating Ecr Repository

resource "aws_ecr_repository" "ecrrepotest" {
  name = "ecr-repo"
}

#Creating Ecs Cluster

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "clusterDev"
}

# Creating Ecs task Definition

resource "aws_ecs_task_definition" "task" {
  family                   = "HTTPserver"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecs-task.arn

  container_definitions = jsonencode([
    {
      name   = "test-container"
      image  = aws_ecr_repository.ecrrepotest.repository_url
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