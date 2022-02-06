provider "aws" {
  region = var.region
}

resource "aws_apprunner_service" "ar" {
  depends_on   = [aws_iam_role.ar-role]
  service_name = var.service

  source_configuration {
    image_repository {
      image_identifier      = "${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.repository}:${var.service}"
      image_repository_type = "ECR"

      image_configuration {
        port = "8080"
      }
    }

    authentication_configuration {
      access_role_arn = aws_iam_role.ar-role.arn
    }
  }

  tags = {
    Name = var.service
  }
}

data "aws_iam_policy_document" "ar-policy-doc" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["build.apprunner.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ar-role" {
  name               = "${var.service}-AppRunnerECRAccessRole"
  assume_role_policy = data.aws_iam_policy_document.ar-policy-doc.json
}

resource "aws_iam_role_policy_attachment" "ecr-attach" {
  role       = aws_iam_role.ar-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}