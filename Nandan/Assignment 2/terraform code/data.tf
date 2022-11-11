data "aws_iam_role" "ecs-task" {
  name = "ecstaskexicution"
}

data "aws_iam_role" "pipeline" {
  name = "AWSCodePipelineServiceRole-ap-south-1-ec2nandankalia"
}
