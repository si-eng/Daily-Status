# Creating codecommit repository

resource "aws_codecommit_repository" "commitrepotest" {
  repository_name = var.repo_name
}

# Creating codebuild project

resource "aws_codebuild_project" "repo-project" {
  name         = "${var.build_project}"
  service_role = "${aws_iam_role.codebuildtest122.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  source {
    type     = "CODECOMMIT"
    location = "${aws_codecommit_repository.commitrepotest.clone_url_http}"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }
}