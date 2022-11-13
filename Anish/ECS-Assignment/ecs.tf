#creating ECR repository
resource "aws_ecrpublic_repository" "test-repo" {
  repository_name = "repo"
  
}


#creating ECS cluster
resource "aws_ecs_cluster" "test-cluster" {
  name = "cluster"
  
}


#creating task definition
resource "aws_ecs_task_definition" "test-td" {
  family = "HTTPserver"
  requires_compatibilities = ["FARGATE"]
  network_mode =   "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn = aws_iam_role.build-role.arn

  container_definitions = jsonencode([
    {
      name = "test-container"
      image  = aws_ecrpublic_repository.test-repo.repository_uri 
      cpu = 256
      memory = 512
      portMappings = [
          {
            containerPort = 80
          }
        ]
  }
  ])
}

#ECS service(specifying load balancer block)
resource "aws_ecs_service" "test-service" {
  name = "test-service"
  cluster = aws_ecs_cluster.test-cluster.id
  task_definition = aws_ecs_task_definition.test-td.id
  desired_count = 2
  launch_type = "FARGATE"


  network_configuration {
    subnets  = [aws_subnet.testsubnet-1.id,aws_subnet.testsubnet-2.id]
    security_groups = [aws_security_group.test-sg.id]
    assign_public_ip = true
  }


  load_balancer {
    target_group_arn = aws_lb_target_group.test-tg.arn
    container_name = "test-container"
    container_port = "80"
  }  
}