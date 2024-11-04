module "codedeploy" {
  source = "../modules/codedeploy"

  app_name = var.app_name
  deployment_group_name = var.deployment_group_name
  ec2_tag_filter = var.ec2_tag_filter
  vm_role_name = local.vm_role_name
}

module "codebuild" {
  source = "../modules/codebuild"

  project_name        = local.project_name
  iam_role_name       = local.project_role_name
  artifact_bucket_arn = module.staging_bucket.arn
  region              = var.region

  github_repo_url    = "https://github.com/${var.github_repo_id}"
  github_repo_branch = var.github_repo_branch
  buildspec          = "./buildspec.yml"

  env_compute_type = var.project_env.compute_type
  env_image        = var.project_env.image
  env_type         = var.project_env.type

  env_vars = [
    {
      name  = "ECR_REPO_URL"
      value = module.ecr.repo_url
    },
    {
      name  = "REPO_NAME"
      value = module.ecr.repo_name
    },

  ]

  tags = local.common_tags
}

resource "aws_codestarconnections_connection" "codestarconnections_connection" {
  name          = var.github_connection_name
  provider_type = "GitHub"
}

module "codepipeline" {
  source = "../modules/codepipeline"

  pipeline_name = var.pipeline_name
  external_s3_bucket = module.staging_bucket.bucket
  pipeline_stages = [ 
    {
      name    = "Source"
      actions = [
        {
          name             = "Source"
          category         = "Source"
          owner            = "AWS"
          provider         = "CodeStarSourceConnection"
          version          = "1"
          input_artifacts  = []
          output_artifacts = ["source_output"]
          configuration = {
            ConnectionArn        = aws_codestarconnections_connection.codestarconnections_connection.arn
            FullRepositoryId     = var.github_repo_id
            BranchName           = var.github_repo_branch
            OutputArtifactFormat = "CODEBUILD_CLONE_REF"
          }
        }
      ]
    },
    {
      name = "Build"
      actions = [
        {
          name = "Build"
          category = "Build"
          owner = "AWS"
          provider = "CodeBuild"
          input_artifacts = ["source_output"]
          output_artifacts = ["build_output"]
          version = "1"
          configuration = {
            ProjectName = module.codebuild.project_name
          }
        }
      ]
    },
    {
      name    = "Deploy"
      actions = [
        {
          name             = "Deploy"
          category         = "Deploy"
          owner            = "AWS"
          provider         = "CodeDeploy"
          version          = "1"
          input_artifacts  = ["build_output"]
          output_artifacts = []
          configuration = {
            ApplicationName     = module.codedeploy.codedeploy_app_name
            DeploymentGroupName = module.codedeploy.codedeploy_deployment_group_name
          }
        }
      ]
    } 
  ]
}