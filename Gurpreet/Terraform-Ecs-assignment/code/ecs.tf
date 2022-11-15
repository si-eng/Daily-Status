#Creating ECR Repository

resource "aws_ecr_repository" "test" {
  name = "nameecr"
}


# Creating ECS Cluster

resource "aws_ecs_cluster" "test" {
  name = "ecs-test"

}

# Creating ECS Task Definition

resource "aws_ecs_task_definition" "main" {
  network_mode             = "vpcmain"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  container_definitions = jsonencode([{
   name        = "task-def"
   image       = aws_ecr_repository.test.repository_uri
   essential   = true
   environment = var.container_environment
   portMappings = [{
     protocol      = "80"
     containerPort = 80
   }]
   }
   ])
}

# Creating ECS Service 

resource "aws_ecs_service" "testservice" {
 name                               = "ecs-service"
 cluster                            = aws_ecs_cluster.ecs-test.id
 task_definition                    = aws_ecs_task_definition.task-def.arn
 desired_count                      = 2
 deployment_minimum_healthy_percent = 50
 deployment_maximum_percent         = 200
 launch_type                        = "FARGATE"
 scheduling_strategy                = "REPLICA"
 
 network_configuration {
   security_groups  = [aws_security_group.securitygroup.id]
   subnets          = [aws_subnet.publicsubnet.id,aws_subnet.privatesubnet.id]
   assign_public_ip = true
 }
 
 load_balancer {
   target_group_arn = aws_lb_target_group.targetgrp.arn
   container_name   = "simple-container"
   container_port   = "80"
 }
}