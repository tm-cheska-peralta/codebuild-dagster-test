variable "project_name" {
  description = "Name of the codebuild project."
  type        = string
}

variable "env_compute_type" {
  description = "Information about the compute resources the build project will use."
  type        = string
}

variable "env_image" {
  description = "Docker image to use for the build project."
  type        = string
}

variable "env_type" {
  description = "Type of build environment to use for related builds."
  type        = string
}

variable "env_vars" {
  description = "Environment variables used in the codebuild project."
  type = list(
      object({
        name  = string
        value = any
    })
  )
  default = []
}

variable "github_repo_url" {
  description = "The github repository link."
  type        = string
}

variable "github_repo_branch" {
  description = "The branch to target in the github repository."
  type        = string
}

variable "buildspec" {
  description = "Path to buildspec."
  type        = string
}

variable "iam_role_name" {
  description = "Name of role attached to the codebuild project."
  type        = string
}

variable "artifact_bucket_arn" {
  description = "S3 bucket arn where artifacts are stored."
  type        = string
}

variable "region" {
  description = "AWS region."
  type        = string
}

variable "tags" {
  type    = any
  default = null
}
