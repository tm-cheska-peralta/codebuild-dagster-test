# AWS CODEBUILD Terraform Module

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name                  | Description                                                         | Type                                                     | Default   | Required   |
|-----------------------|---------------------------------------------------------------------|----------------------------------------------------------|-----------|------------|
| `project_name`        | Name of the codebuild project.                                      | `string`                                                 | `None`    | yes        |
| `env_compute_type`    | Information about the compute resources the build project will use. | `string`                                                 | `None`    | yes        |
| `env_image`           | Docker image to use for the build project.                          | `string`                                                 | `None`    | yes        |
| `env_type`            | Type of build environment to use for related builds.                | `string`                                                 | `None`    | yes        |
| `env_vars`            | Environment variables used in the codebuild project.                | <pre>list(object({<br>  name = string<br>  value = any<br>}))</pre> | `[]`      | no         |
| `github_repo_url`     | The github repository link.                                         | `string`                                                 | `None`    | yes        |
| `github_repo_branch`  | The branch to target in the github repository.                      | `string`                                                 | `None`    | yes        |
| `buildspec`           | Path to buildspec.                                                  | `string`                                                 | `None`    | yes        |
| `iam_role_name`       | Name of role attached to the codebuild project.                     | `string`                                                 | `None`    | yes        |
| `artifact_bucket_arn` | S3 bucket arn where artifacts are stored.                           | `string`                                                 | `None`    | yes        |
| `region`              | AWS region.                                                         | `string`                                                 | `None`    | yes        |
| `tags`                | Default tags.                                                       | `any`                                                    | `None`    | no         |

## Outputs

| Name           | Description    |
|----------------|----------------|
| `project_name` | Name of the codebuild project. |