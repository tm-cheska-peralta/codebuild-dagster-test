data "aws_caller_identity" "me" {}

resource "aws_codebuild_project" "project" {
  name          = var.project_name
  service_role  = aws_iam_role.codebuild_role.arn

  source {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = var.env_compute_type
    image           = var.env_image
    type            = var.env_type
    privileged_mode = true

    dynamic "environment_variable" {
      for_each = local.all_env_vars
      content {
        name = environment_variable.value["name"]
        value = environment_variable.value["value"]
      }
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  tags = var.tags
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "codebuild_role" {
  name = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

data "aws_iam_policy_document" "codebuild_policy" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:BatchCheckLayerAvailability",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
    ]
    resources = ["${var.artifact_bucket_arn}/*"]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "codestar-connections:UseConnection",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "codebuild_policy" {
  policy = data.aws_iam_policy_document.codebuild_policy.json
}

resource "aws_iam_role_policy_attachment" "codebuild_aws_policy_attachement" {
  role = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}