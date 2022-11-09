# ###############
# #################
# resource "aws_iam_role_policy" "codepipeline_policy11" {
#   name = "nodepolicytest11"
#   role = aws_iam_role.codepipeline_role.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect":"Allow",
#       "Action": [
#         "*"
#       ],
#       "Resource": [
#         "*" 
#       ]
#     },
#     {
#       "Effect": "Allow",
#       "Action": [
#         "*"
#       ],
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }
# resource "aws_iam_role" "codepipeline_role" {
#   name = "noderoletest1111"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "codepipeline.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }


#################################################################################################################
##  VPC
##################################################################################################################


#vpc
resource "aws_vpc" "ecs-vpc" {
  cidr_block = "${var.cidr}"

  tags = {
    Name = "ecs-vpc"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "pub-subnets" {
  count                   = length(var.azs)
  vpc_id                  = "${aws_vpc.ecs-vpc.id}"
  availability_zone       = "${var.azs[count.index]}"
  cidr_block              = "${var.subnets-ip[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnets"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "i-gateway" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"

  tags = {
    Name = "ecs-igtw"
  }
}


##############################################################################################################
##  Var to vpc
#############################################################################################################

variable "cidr" {
  type    = string
  default = "145.0.0.0/16"
}

variable "azs" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "subnets-ip" {
  type = list(string)
  default = [
    "145.0.1.0/24",
    "145.0.2.0/24"
  ]

}

###################################################################################################################
# iam role
#####################################################################################################################

resource "aws_iam_role" "codebuild-role20221" {
  name = "codebuild-role313"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "codebuild-policy20221" {
  role = "${aws_iam_role.codebuild-role20221.name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["codecommit:GitPull"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetAuthorizationToken",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
        "ecr:UploadLayerPart"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
        "logs:PutLogEvents"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketAcl",
        "s3:GetBucketLocation"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
            "Effect": "Allow",
            "Action": [
                "ecr-public:*",
                "sts:GetServiceBearerToken"
            ],
            "Resource": "*"
        }
    ]


  })

}
##############################################################################################################
# Route Table
##############################################################################################################

# TABLE FOR PUBLIC SUBNETS
resource "aws_route_table" "pub-table" {
  vpc_id = "${aws_vpc.ecs-vpc.id}"
}

resource "aws_route" "pub-route" {
  route_table_id         = "${aws_route_table.pub-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.i-gateway.id}"
}

resource "aws_route_table_association" "as-pub" {
  count          = length(var.azs)
  route_table_id = "${aws_route_table.pub-table.id}"
  subnet_id      = "${aws_subnet.pub-subnets[count.index].id}"
}


##############################################################################################################
# Security Group
#############################################################################################################

resource "aws_security_group" "sg1" {                                 #(The first Sec-Group is for the ECS Service)
  name        = "golang-server"
  description = "Port 5000"
  vpc_id      = aws_vpc.ecs-vpc.id

  ingress {
    description      = "Allow Port 5000"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg2" {                            #(The second Sec-Group is for the Application Load Balancer)
  name        = "golang-server-alb"
  description = "Port 80"
  vpc_id      = aws_vpc.ecs-vpc.id

  ingress {
    description      = "Allow Port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


###########################################################################################################
## LB
###########################################################################################################

resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = ["${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}"]

}

resource "aws_lb_target_group" "tg-group" {
  name        = "tg-group"
  port        = "5000"
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"

}

# resource "aws_lb_target_group" "tg-group2" {
#   name        = "tg-group313"
#   port        = "80"
#   protocol    = "HTTP"
#   vpc_id      = "${aws_vpc.server1.id}"
#   target_type = "ip"

# }
resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = "${aws_lb.app-lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
  }
}


###########################################################################################################################
#ECR repository
############################################################################################################################

resource "aws_ecrpublic_repository" "foo"  {
  repository_name = "ecr-repo121"
}

#####################################################################################################
# ECS Cluster
####################################################################################################
resource "aws_ecs_cluster" "ecs-cluster2022" {
  name = "clusterDev"
}
#######################################################################################################################
# task desfination
#######################################################################################################################

resource "aws_ecs_task_definition" "task" {
  family                   = "HTTPserver"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs-task.arn}"

  container_definitions = jsonencode([
    {
      name   = "golang-container"
      image  = aws_ecrpublic_repository.foo.repository_uri #URI
      cpu    = 256
      memory = 512
      portMappings = [
        {
          containerPort = 8000
        }
      ]
    }
  ])
}

##########################################################################################################
# Ecs service
#####################################################################################################

resource "aws_ecs_service" "svc" {
  name            = "golang-Service"
  cluster         = "${aws_ecs_cluster.ecs-cluster2022.id}"
  task_definition = "${aws_ecs_task_definition.task.id}"
  desired_count   = 2
  launch_type     = "FARGATE"


  network_configuration {
    subnets          = ["${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}"]
    security_groups  = ["${aws_security_group.sg1.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
    container_name   = "golang-container"
    container_port   = "8000"
  }
}

##############################################################################################

# #####################################################################################################################################################


variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "github_branch" {
  description = "Repository branch to connect to"
  default     = "master"
}

variable "github_owner" {
  description = "GitHub repository owner"
  default     = "priyashukla1411"
}
variable "github_repo" {
  description = "GitHub repository name"
  default     = "https://github.com/priyashukla1411/react-native.git"
}

variable "github_token" {
  description = "This is github authentication token"
  default = "**************"
  type = string
}

###############
variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifacts-bucket-devops-rectnative1"
}
resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "artifacts-bucket-devops-rectnative1"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
##########################################################################################
# code build:-

data "template_file" "buildspec" {
  template = "buildspec.yml"
  
}

resource "aws_codebuild_project" "node_build" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "node_build"
  queued_timeout = 480
  service_role   = aws_iam_role.codebuild_role99888.arn
  tags = {
    Environment = var.env
  }

  artifacts {
   
    type                   = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    type  = "GITHUB"
    location = "https://github.com/priyashukla1411/react-native.git"
    git_clone_depth = 1
  }
 
}

resource "aws_iam_role" "codebuild_role99888" {
  name = "reactnative"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy" "codebuild_policy" {
  name = "nodepolicytest10"
  role = aws_iam_role.codebuild_role99888.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
       
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::${var.artifacts_bucket_name}/*"
            ],
            "Action": [
                "*"
            ]
        },
        {
          "Effect": "Allow",
          "Resource": [
            "*"
          ],
          "Action": [
            "*"
          ]
        }
    ]
}
EOF
}


# # pipeline :-

resource "aws_codepipeline" "node_pipeline11" {
  name     = "node_pipeline11"
  role_arn = aws_iam_role.codepipeline_role.arn
  tags     = {
    Environment = var.env
  }

  artifact_store {
    location = var.artifacts_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      # input_artifacts  = []
      output_artifacts = ["SourceArtifact"]

      configuration = {
        Owner      = "priyashukla1411"
        Repo       = "react-native"  
        Branch     = "master"
        OAuthToken = "**************"
 
      }
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "EnvironmentVariables" = jsonencode(
          [
            {
              name  = "environment"
              type  = "PLAINTEXT"
              value = var.env
            },
          ]
        )
        "ProjectName" = "node_build"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name = "Build"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Deploy"

    action {
      category = "Deploy"
      configuration = {
        "BucketName" = var.artifacts_bucket_name
        "Extract"    = "true"
      }
      input_artifacts = [
        "BuildArtifact",
      ]
      name             = "Deploy"
   
      owner            = "AWS"
      provider         = "S3"

      version          = "1"
    }
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name = "noderoletest1111"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy11" {
  name = "nodepolicytest11"
  role = aws_iam_role.codepipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "*"
      ],
      "Resource": [
        "*" 
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

data "aws_iam_role" "ecs-task" {
  name = "ecs-task-execution"
}

# output "repo_url" {
#   value = aws_codecommit_repository.repo31.clone_url_http
# }

output "alb_dns" {
  value = aws_lb.app-lb.dns_name
}


# variable "repo_name" {
#   type    = string
#   default = "dev-repo21"
# }

variable "branch_name" {
  type    = string
  default = "master"
}

# variable "build_project" {
#   type    = string
#   default = "dev-build-repo21"
# }






