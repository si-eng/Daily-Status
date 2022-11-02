data "aws_iam_role" "pipeline_role" {
  name = "AWSCodePipelineServiceRole-ap-south-1-django"
}

data "aws_iam_role" "ecs-task" {
  name = "ecsTaskExecutionRole"
}