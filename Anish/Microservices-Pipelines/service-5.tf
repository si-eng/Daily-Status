
resource "aws_ecrpublic_repository" "repo-5" {

  repository_name = "repo-5"
}



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
      image  = "${aws_ecrpublic_repository.repo-5.repository_uri}" 
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
    subnets          = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
    security_groups  = ["${aws_security_group.test-tg.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg4-group.arn}"
    container_name   = "service5"
    container_port   = "80"
  }
}



resource "aws_codebuild_project" "my_docker4_build4" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "my_docker4_build4"
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
    location        = "https://github.com/anish612/ECS-Buildspec-Dockerfile.git"
    git_clone_depth = 1
  }
}


resource "aws_codepipeline" "Pipeline-5" {
  name     = "Pipeline-5"
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
        Owner      = "anish612"
        Repo       = "ECS-Buildspec-Dockerfile"
        Branch     = "main"
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
        ProjectName = "my_docker4_build4"
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
        ClusterName = "clusterDev"
        ServiceName = "service5"
        FileName    = "service5.json"
      }
    }
  }
}

