data "aws_iam_role" "pipeline_role" {
  name = "AWSCodePipelineServiceRole-us-east-1-django"
}

data "aws_iam_role" "ecs-task" {
  name = "ecsTaskExecutionRole"
}