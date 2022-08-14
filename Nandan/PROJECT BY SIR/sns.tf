resource "aws_sns_topic" "user_updates" {
  name = "SNS_EC2"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "kalianandan@seasiainfotech.com"
}  

resource "aws_cloudwatch_event_rule" "console" {
  name        = "capture-aws-sign-in"
  description = "Capture each AWS Console Sign In"

  event_pattern = <<EOF
{
  "source": ["aws.ec2"]
}
EOF
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = aws_sns_topic.user_updates.name
  arn       = aws_sns_topic.user_updates.id
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.user_updates.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.user_updates.arn]
  }
}