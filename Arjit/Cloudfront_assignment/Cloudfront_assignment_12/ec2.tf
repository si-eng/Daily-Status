resource "aws_instance" "cicd-terraform" {
  ami           = "ami-0149b2da6ceec4bb0" 
  key_name      = "KaranAC"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub-a.id
  
  security_groups = [aws_security_group.security_terraform_grp.id ]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                
                sudo apt install ruby-full -y
                sudo apt install wget -y 
                sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
                sudo chmod +x ./install
                sudo ./install auto  
                sudo service codedeploy-agent status 
                sudo service codedeploy-agent restart
                sudo service codedeploy-agent restart

              EOF


  tags= {
    Name = "terraform_cicd"
  }
}



resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "ec2_profile"
  role = aws_iam_role.ec2role.name
}

resource "aws_iam_role" "ec2role" {
  name = "test_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}


resource "aws_iam_role_policy" "codepipeline_policyForEc2" {
  name = "codepipeline_policyForEc2"
  role = aws_iam_role.ec2role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::*/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild",
        "codedeploy:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}