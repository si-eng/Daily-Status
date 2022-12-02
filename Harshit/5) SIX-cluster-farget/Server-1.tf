#########################################            ECR-Repository
resource "aws_ecrpublic_repository""ecr-repo-1" {
  repository_name = "ecr-repo-1"
}


#######################################################     ECS-TASK

resource "aws_ecs_task_definition" "task-1" {
  family                   = "HTTPserver-1"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecs-task.arn 

  container_definitions = jsonencode([
    {
      name   = "container-1"
      image  = aws_ecrpublic_repository.ecr-repo-1.repository_uri#URI #####################################################
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

############################################## ECS service 1

resource "aws_ecs_service" "svc-1" {
  name            = "Service-1"
  cluster         = "${aws_ecs_cluster.ecs-cluster-main.id}"
  task_definition = "${aws_ecs_task_definition.task-1.id}"
  desired_count   = 1
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}"]
    security_groups  = ["${aws_security_group.sg1.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group-1.arn}"
    container_name   = "container-1"
    container_port   = "80"
  }
}
############################################################################################################################################3

##############################################################################################################################


resource "aws_codepipeline""pipeline-1" {
  name     = "pipeline-1"
  role_arn = "${data.aws_iam_role.pipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.bucketbucket.bucket}"
    type     = "S3"
  }
  # SOURCE
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = "${var.repo_name}"
        BranchName     = "${var.branch_name}"
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
        ProjectName = "${var.build_project}"
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
        ClusterName = "ecs-cluster-main"
        ServiceName = "svc-1"
        FileName    = "imagedefinitions-1.json"
      }
    }
  }
}


##############################################################################################3




