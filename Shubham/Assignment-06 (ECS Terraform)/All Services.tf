########################################### Service 1 ##########################################

resource "aws_ecs_task_definition" "task" {
  family                   = "task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service1"
      image  = "${aws_ecrpublic_repository.ecr1.repository_uri}" #URI
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



resource "aws_ecs_service" "service1" {
  name            = "service1"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 1
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
    container_name   = "service1"
    container_port   = "80"
  }
}






resource "aws_codebuild_project" "docker_build1" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build1"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}



resource "aws_codepipeline" "pipeline6" {
  name     = "pipeline6"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "*******"
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
        ProjectName = "docker1_build"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service1"
        FileName    = "service1.json"
      }
    }
  }
}



resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service1"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy" {
  name               = "scale_up_policy"
  depends_on         = [aws_appautoscaling_target.ecs_target]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service1"
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
  resource_id        = "service/clusterDev/service1"
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







resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60                             
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy.arn]

  
}


resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]

  
}


############################# Service 2 #####################################


resource "aws_ecs_task_definition" "task1" {
  family                   = "task1"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service2"
      image  = "${aws_ecrpublic_repository.ecr2.repository_uri}" 
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




resource "aws_ecs_service" "service2" {
  name            = "service2"
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
    container_name   = "service2"
    container_port   = "80"
  }
}




resource "aws_codebuild_project" "docker_build2" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build2"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}


resource "aws_codepipeline" "pipeline1" {
  name     = "pipeline1"
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
         Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "*****"
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
        ProjectName = "docker11_build1"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service2"
        FileName    = "service2.json"
      }
    }
  }
}



resource "aws_appautoscaling_target" "ecs_target1" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service2"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy1" {
  name               = "scale_up_policy1"
  depends_on         = [aws_appautoscaling_target.ecs_target1]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service2"
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





resource "aws_appautoscaling_policy" "scale_down_policy1" {
  name               = "scale_down_policy1"
  depends_on         = [aws_appautoscaling_target.ecs_target1]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service2"
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




resource "aws_cloudwatch_metric_alarm" "cpu_high1" {
  alarm_name          = "cpu-high1"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                            
  metric_name         = "CPUUtilization1"
  namespace           = "AWS/ECS"
  period              = 60                             
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy1.arn]

  
}


resource "aws_cloudwatch_metric_alarm" "cpu_low1" {
  alarm_name          = "cpu-low1"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization1"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy1.arn]

  
}

######################################### Service 3 ####################################################



resource "aws_ecs_task_definition" "task2" {
  family                   = "task2"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service3"
      image  = "${aws_ecrpublic_repository.ecr3.repository_uri}" 
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




resource "aws_ecs_service" "service3" {
  name            = "service3"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task2.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg2-group.arn}"
    container_name   = "service3"
    container_port   = "80"
  }
}


resource "aws_codebuild_project" "docker_build3" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build53"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}



resource "aws_codepipeline" "pipeline2" {
  name     = "pipeline2"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "****"
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
        ProjectName = "docker12_build2"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service3"
        FileName    = "service3.json"
      }
    }
  }
}


resource "aws_appautoscaling_target" "ecs_target2" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service3"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy2" {
  name               = "scale_up_policy2"
  depends_on         = [aws_appautoscaling_target.ecs_target2]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service3"
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





resource "aws_appautoscaling_policy" "scale_down_policy2" {
  name               = "scale_down_policy2"
  depends_on         = [aws_appautoscaling_target.ecs_target2]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service3"
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


resource "aws_cloudwatch_metric_alarm" "cpu_high2" {
  alarm_name          = "cpu-high2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization2"
  namespace           = "AWS/ECS"
  period              = 60                              
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy2.arn]

  
}


resource "aws_cloudwatch_metric_alarm" "cpu_low2" {
  alarm_name          = "cpu-low2"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization2"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy2.arn]

  
}

########################################## Service 4 #########################################


resource "aws_ecs_task_definition" "task3" {
  family                   = "task3"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service4"
      image  = "${aws_ecrpublic_repository.ecr4.repository_uri}" 
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




resource "aws_ecs_service" "svc4" {
  name            = "service4"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task3.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg3-group.arn}"
    container_name   = "service4"
    container_port   = "80"
  }
}



resource "aws_codebuild_project" "docker_build4" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build4"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}



resource "aws_codepipeline" "pipeline33" {
  name     = "pipeline3"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "*****"
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
        ProjectName = "docker13_build3"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service4"
        FileName    = "service4.json"
      }
    }
  }
}



resource "aws_appautoscaling_target" "ecs_target3" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service4"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy3" {
  name               = "scale_up_policy3"
  depends_on         = [aws_appautoscaling_target.ecs_target3]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service4"
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





resource "aws_appautoscaling_policy" "scale_down_policy3" {
  name               = "scale_down_policy3"
  depends_on         = [aws_appautoscaling_target.ecs_target3]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service4"
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



resource "aws_cloudwatch_metric_alarm" "cpu_high3" {
  alarm_name          = "cpu-high3"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization3"
  namespace           = "AWS/ECS"
  period              = 60                        
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy3.arn]

  
}

resource "aws_cloudwatch_metric_alarm" "cpu_low3" {
  alarm_name          = "cpu-low3"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization3"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy3.arn]

  
}

############################################ Service 4 ##########################################


resource "aws_ecs_task_definition" "task3" {
  family                   = "task3"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service4"
      image  = "${aws_ecrpublic_repository.ecr4.repository_uri}" 
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




resource "aws_ecs_service" "svc4" {
  name            = "service4"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task3.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg3-group.arn}"
    container_name   = "service4"
    container_port   = "80"
  }
}



resource "aws_codebuild_project" "docker_build5" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build5"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}



resource "aws_codepipeline" "pipeline3" {
  name     = "pipeline3"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "*****"
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
        ProjectName = "docker13_build3"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service4"
        FileName    = "service4.json"
      }
    }
  }
}



resource "aws_appautoscaling_target" "ecs_target3" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service4"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy3" {
  name               = "scale_up_policy3"
  depends_on         = [aws_appautoscaling_target.ecs_target3]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service4"
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





resource "aws_appautoscaling_policy" "scale_down_policy3" {
  name               = "scale_down_policy3"
  depends_on         = [aws_appautoscaling_target.ecs_target3]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service4"
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



resource "aws_cloudwatch_metric_alarm" "cpu_high3" {
  alarm_name          = "cpu-high3"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization3"
  namespace           = "AWS/ECS"
  period              = 60                        
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy3.arn]

  
}

resource "aws_cloudwatch_metric_alarm" "cpu_low3" {
  alarm_name          = "cpu-low3"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization3"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy3.arn]

  
}

######################################## Service 5 ##############################################



resource "aws_ecs_task_definition" "task4" {
  family                   = "task4"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service5"
      image  = "${aws_ecrpublic_repository.ecr5.repository_uri}" 
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




resource "aws_ecs_service" "service5" {
  name            = "service5"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task4.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg4-group.arn}"
    container_name   = "service5"
    container_port   = "80"
  }
}



resource "aws_codebuild_project" "docker_build6" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build6"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}


resource "aws_codepipeline" "pipeline4" {
  name     = "pipeline4"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "*******"
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
        ProjectName = "docker14_build4"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service5"
        FileName    = "service5.json"
      }
    }
  }
}



resource "aws_appautoscaling_target" "ecs_target4" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service5"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy4" {
  name               = "scale_up_policy4"
  depends_on         = [aws_appautoscaling_target.ecs_target4]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service5"
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





resource "aws_appautoscaling_policy" "scale_down_policy4" {
  name               = "scale_down_policy4"
  depends_on         = [aws_appautoscaling_target.ecs_target4]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service5"
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




resource "aws_cloudwatch_metric_alarm" "cpu_high4" {
  alarm_name          = "cpu-high4"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization4"
  namespace           = "AWS/ECS"
  period              = 60                        
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy4.arn]

  
}

resource "aws_cloudwatch_metric_alarm" "cpu_low4" {
  alarm_name          = "cpu-low4"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization4"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy4.arn]

  
}

############################################# Service 6 ###############################################



resource "aws_ecs_task_definition" "task5" {
  family                   = "task5"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "service6"
      image  = "${aws_ecrpublic_repository.ecr6.repository_uri}" 
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



resource "aws_ecs_service" "service6" {
  name            = "service6"
  cluster         = "${aws_ecs_cluster.ecs-cluster.id}"
  task_definition = "${aws_ecs_task_definition.task5.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-a.id}", "${aws_subnet.pub-b.id}"]
    security_groups  = ["${aws_security_group.sg3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg5-group.arn}"
    container_name   = "service6"
    container_port   = "80"
  }
}



resource "aws_codebuild_project" "docker_build7" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "docker_build7"
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
    location        = "https://github.com/Siarajput421/Dockerpipe1.git"
    git_clone_depth = 1
  }
}


resource "aws_codepipeline" "pipeline5" {
  name     = "pipeline5"
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
        Owner      = "Siarajput421"
        Repo       = "Dockerpipe1"
        Branch     = "main"
        OAuthToken = "****"
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
        ProjectName = "docker_build5"
      }
    }
  }
# Deployment
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
        ClusterName = "clusterDev"
        ServiceName = "service6"
        FileName    = "service6.json"
      }
    }
  }
}


resource "aws_appautoscaling_target" "ecs_target5" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterDev/service6"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scale_up_policy5" {
  name               = "scale_up_policy5"
  depends_on         = [aws_appautoscaling_target.ecs_target5]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service6"
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





resource "aws_appautoscaling_policy" "scale_down_policy5" {
  name               = "scale_down_policy5"
  depends_on         = [aws_appautoscaling_target.ecs_target5]
  service_namespace  = "ecs"
  resource_id        = "service/clusterDev/service6"
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



resource "aws_cloudwatch_metric_alarm" "cpu_high5" {
  alarm_name          = "cpu-high5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 3                              
  metric_name         = "CPUUtilization5"
  namespace           = "AWS/ECS"
  period              = 60                        
  statistic           = "Maximum"
  threshold           = 80
  
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy5.arn]

  
}


resource "aws_cloudwatch_metric_alarm" "cpu_low5" {
  alarm_name          = "cpu-low5"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization5"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 10
  
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy5.arn]

  
}
