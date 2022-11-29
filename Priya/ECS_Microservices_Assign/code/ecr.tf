 #ECS CLUSTER

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "Cluster-prod"
}
############################################################   task  &  servic 1     #########################################################
resource "aws_ecs_task_definition" "task" {
  family                   = "task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-service.arn}"

 container_definitions = jsonencode([
    {
      name   = "html1_container"
      image  = "033746436249.dkr.ecr.us-east-2.amazonaws.com/dockerfile1:latest"
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
# ECS SERVICE 1
resource "aws_ecs_service" "svc1" {
  name            = var.service1
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
    container_name   = "html1_container"
    container_port   = "80"
  }
}


# ##################################################################################################################################
resource "aws_codebuild_project" "assignment_pipeline_prod" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "assignment_pipeline_prod"
  queued_timeout = 480
  service_role   = aws_iam_role.codebuild_role.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    
    type                   = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/priyashukla1411/ecs-assign.git"
    git_clone_depth = 1
  }
}



# PIPELINE ---------------------------------

resource "aws_codepipeline" "assignment_pipeline" {
  name     = "assignment_pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.artifacts_bucket_name
    type     = "S3"
  }
  # SOURCE
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      input_artifacts  = []
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = "priyashukla1411"
        Repo       = "6_ECS_Microservices"
        Branch     = "master"
        OAuthToken = "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"
      }
    }
  }
  # BUILD
  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = "assignment_pipeline_prod"
      }
    }
  }
  # DEPLOY
  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ClusterName = "Cluster-prod"
        ServiceName = var.service1  
        FileName    = "imagedefinitions1.json"
      }
    }
  }
}
resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/Cluster-prod/html_service1"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy" {
  name               = "scale_up_policy"
  depends_on         = [aws_appautoscaling_target.ecs_target]
  service_namespace  = "ecs"
  resource_id        = "service/Cluster-prod/html_service1"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
}





resource "aws_appautoscaling_policy" "scale_down_policy" {
  name               = "scale_down_policy"
  depends_on         = [aws_appautoscaling_target.ecs_target]
  service_namespace  = "ecs"
   resource_id        = "service/Cluster-prod/html_service1"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}



################  watchhhhhhh#########
resource "aws_cloudwatch_metric_alarm" "up" {
  alarm_name          = "up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60                             
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy.arn]

  
}


resource "aws_cloudwatch_metric_alarm" "down" {
  alarm_name          = "down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]

  
}



