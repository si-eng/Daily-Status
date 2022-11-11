#creating ECR repository
resource "aws_ecr_repository" "test-repo" {
  name = "test-repo"
  
}



#creating ECS cluster
resource "aws_ecs_cluster" "test-cluster" {
    name = "test-cluster"
  
}


#creating task definition
resource "aws_ecs_task_definition" "test-td" {
  family = "test-td"
  requires_compatibilities = [ "FARGATE" ]
  network_mode =   "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn = aws_iam_role.build-role.arn

  container_definitions = jsonencode({
    name = "test-container"
    image = ""
    cpu = 1024
    memory = 2048
    portMappings = [
        {
          containerPort = 80
        }
      ]
  })
}