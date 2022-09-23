resource "aws_launch_configuration" "aws_autoscale_conf" {
  name          = "web_config"
  image_id      = "ami-0ee23bfc74a881de5"
  instance_type = "t2.micro"
  key_name      = "NVaccess"

  user_data = <<-EOF
		    #! /bin/bash
            sudo apt-get update
		    sudo apt-get install -y apache2
		    sudo systemctl start apache2
		    sudo systemctl enable apache2
		    echo "<h1>Autoscaling via Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF

}

resource "aws_autoscaling_group" "mygroup" {
    availability_zones        = ["us-east-1a"]
    name                      = "autoscalegroup"
    max_size                  = 2
    min_size                  = 1
    health_check_grace_period = 30
    health_check_type         = "EC2"
    force_delete              = true
    termination_policies      = ["OldestInstance"]
    launch_configuration      = aws_launch_configuration.aws_autoscale_conf.name
}


resource "aws_autoscaling_schedule" "mygroup_schedule" {
  scheduled_action_name  = "autoscalegroup_action"
  min_size               = 1
  max_size               = 2
  desired_capacity       = 1
  start_time             = "2022-09-23T12:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.mygroup.name
}

resource "aws_autoscaling_policy" "mygroup_policy" {
  name                   = "autoscalegroup_policy"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.mygroup.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
    alarm_name = "web_cpu_alarm_up"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "60"
    statistic = "Average"
    threshold = "10"
    alarm_actions = [
        "${aws_autoscaling_policy.mygroup_policy.arn}"
    ]
    dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.mygroup.name}"
  }
}


resource "aws_autoscaling_notification" "auto_notifications" {
  group_names = [
    aws_autoscaling_group.mygroup.name,
    
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.testautosns.arn
}

resource "aws_sns_topic" "testautosns" {
  name = "testautosns-topic"

  
}

resource "aws_sqs_queue" "terra_queue" {
  name                      = "terraform-notice-queue"
  
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "production"
  }
}



resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name = "terraform-dead-deadletter-queue"
}


resource "aws_sns_topic_subscription" "notice_updates_sqs_target" {
  topic_arn = aws_sns_topic.testautosns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.terra_queue.arn
}



resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.terra_queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.terra_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.testautosns.arn}"
        }
      }
    }
  ]
}
POLICY
}