
# CodeCommit repository
resource "aws_codecommit_repository" "test-commit" {
    repository_name = aws_ecrpublic_repository.test-repo.repository_name
  
}



#CodeBuild

resource "aws_codebuild_project" "test-project" {
    name = "test-project"
    service_role = aws_iam_role.build-role.arn
  


    artifacts {
    type = "NO_ARTIFACTS"
  }

    source {
    type     = "CODECOMMIT"
    location = "${aws_codecommit_repository.test-commit.clone_url_http}"
    }

    environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
    }
}