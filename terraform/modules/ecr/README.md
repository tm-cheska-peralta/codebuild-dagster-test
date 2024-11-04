# AWS ECR Terraform Module

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name                                                                                                               | Type     |
|--------------------------------------------------------------------------------------------------------------------|----------|
| [`aws_ecr_repository`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name       | Description                 | Type     | Default   | Required   |
|------------|-----------------------------|----------|-----------|------------|
| `ecr_name` | Name of the ECR repository. | `string` | `None`    | yes        |
| `tags`     | Default tags              | `any`    | `None`    | no         |

## Outputs

| Name        | Description    |
|-------------|----------------|
| `repo_name` | Repository name in the ECR. |
| `repo_url`  | Respository URL. |