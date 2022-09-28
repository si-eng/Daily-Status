resource "aws_codestarconnections_connection" "gitwebhook" {
  name          = "gitwebhook"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "django_pipeline" {
  name     = "django_pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn
  tags     = {
    Environment = var.env
  }

  artifact_store {
    location = var.artifacts_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      input_artifacts  = []
      output_artifacts = ["SourceArtifact"]

      configuration = {
        Owner      = "arjit547"
        Repo       = "Django"  
        Branch     = "main"
        OAuthToken = "**************"
      }
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "environment"
              type  = "PLAINTEXT"
              value = var.env
            },
          ]
        )
        "ProjectName" = "django_build"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
      ApplicationName    = aws_codedeploy_app.djangodeploy.name
      DeploymentGroupName = aws_codedeploy_deployment_group.djangodeploy.deployment_group_name 
      }
      input_artifacts = [
        "BuildArtifact",
      ]
      name             = "Deploy"
      output_artifacts = []
      owner            = "AWS"
      provider         = "CodeDeploy"
      
      version          = "1"
    }
  }
}



resource "aws_iam_role" "codepipeline_role" {
  name = "djangoroletest11"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "djangopolicytest11"
  role = aws_iam_role.codepipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "*"
      ],
      "Resource": [
        "*" 
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
