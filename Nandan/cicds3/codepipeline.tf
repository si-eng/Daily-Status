# code for pipeine
resource "aws_codepipeline" "reactCodePipeline" {
  name = "reactCodePipeline"
  role_arn = aws_iam_role.codepipeline_role2.arn

  artifact_store {
    location = "sthreecicd"
    type = "S3"
  }

  stage {
    name = "Source"

    action {
      name = "Source"
      category = "Source"
      owner = "ThirdParty"
      provider = "GitHub"
      version = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        OAuthToken = var.github_token
        Owner = var.github_owner
        Repo = var.github_repo
        Branch = var.branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name = "Build"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"
      input_artifacts = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]

      configuration = {
        ProjectName = "react_native_build"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name = "Deploy"
      category = "Deploy"
      owner = "AWS"
      provider = "S3"
      input_artifacts = ["BuildArtifact"]
      version = "1"

      configuration = {
      BucketName    = "sthreecicd"
      Extract = "true"  
    }
    }
  }
}


#role for code pipelines

resource "aws_iam_role" "codepipeline_role2" {
  name                 = "${var.app_name}-codepipeline-role"
  assume_role_policy   = <<EOF
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

#policy to provide s3 bucket access
resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "${var.app_name}-codepipeline_policy"
  role = aws_iam_role.codepipeline_role2.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::*/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild",
        "codedeploy:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


#policy to provide ec2 access to codepipeline

resource "aws_iam_policy" "codepipeline_policyEC2" {
  name = "${var.app_name}-codepipeline_policyEC2"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::*/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild",
        "codedeploy:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


