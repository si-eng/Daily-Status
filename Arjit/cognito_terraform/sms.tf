

resource "random_string" "external_id" {
  length  = 15
  special = false
}





resource "aws_iam_role" "cognito_sms" {
  name = "login-pool-sms-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "cognito-idp.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "${random_string.external_id.result}"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cognito_sms" {
  role = aws_iam_role.cognito_sms.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sns:publish"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
POLICY
}