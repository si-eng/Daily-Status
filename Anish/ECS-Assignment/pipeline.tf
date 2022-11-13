resource "aws_codepipeline" "test-pipeline" {
    name = "mypipeline"
    role_arn = aws_iam_role.build-role.arn

    artifact_store {
      location = aws_s3_bucket.mybucket-ecs1087.bucket
      type = "S3"

    }

   # source step

   stage {
     name = "source"
       action {     
        name = "source"
        category = "Source"
        owner ="AWS"
        provider = "CodeCommit"
        version = "1"
        output_artifacts = ["source_output"]

   
     
     
        configuration = {
            RepositoryName = aws_ecrpublic_repository.test-repo.repository_name
            BranchName     =  "master"
        }
       }
   }

#build
    stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"
      configuration = {
        ProjectName = "test-project"
      }
    }
  }

#deploy
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
        ClusterName = "cluster"
        ServiceName = "test-service"
        FileName    = "imagedefinitions.json"
      }
    }
  }

}
    

