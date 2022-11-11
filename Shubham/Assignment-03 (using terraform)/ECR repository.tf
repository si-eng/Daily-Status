resource "aws_ecrpublic_repository" "foo"  {
  repository_name = "ecr-repo121"
}

resource "aws_ecs_cluster" "ecs-cluster2022" {
  name = "clusterDev"
}

resource "aws_ecs_task_definition" "ecs-task" {
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