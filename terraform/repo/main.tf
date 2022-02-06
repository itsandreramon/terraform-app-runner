provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "demo" {
  name                 = var.repository
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

