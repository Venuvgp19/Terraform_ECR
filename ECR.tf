resource "aws_ecr_repository" "my_ecr" {
  name = "ecr-test"
}

resource "aws_ecr_lifecycle_policy" "ecrpolicy" {
  repository = aws_ecr_repository.my_ecr.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 30 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository_policy" "cross-account-policy" {
  repository = aws_ecr_repository.my_ecr.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": {
               "AWS": "${var.cross-account-id}"
      },
            "Action": [
                "ecr:BatchGetImage",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages"
            ]
        }
    ]
}
EOF
}
