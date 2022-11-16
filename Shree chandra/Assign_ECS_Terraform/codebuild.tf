###########################################################################################
data "template_file" "buildspec" {
  template = "buildspec.yml"
  
}

resource "aws_codebuild_project" "node_build" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "node_build"
  queued_timeout = 480
  service_role   = aws_iam_role.codebuild_role99888.arn
  tags = {
    Environment = var.env
  }

  artifacts {
   
    type                   = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
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
    type  = "GITHUB"
    location = "https://github.com/shreechandra/react-native-repo"
    git_clone_depth = 1
  }
 
}

resource "aws_iam_role" "codebuild_role99888" {
  name = "reactnative"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy" "codebuild_policy" {
  name = "nodepolicytest10"
  role = aws_iam_role.codebuild_role99888.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
       
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::${var.artifacts_bucket_name}/*"
            ],
            "Action": [
                "*"
            ]
        },
        {
          "Effect": "Allow",
          "Resource": [
            "*"
          ],
          "Action": [
            "*"
          ]
        }
    ]
}
EOF
}