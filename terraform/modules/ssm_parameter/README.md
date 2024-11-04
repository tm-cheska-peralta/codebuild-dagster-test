## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type| Default | Required |
|---|---|---|---|:---:|
| parameters | A map of parameter objects, each containing a `value` (string) and a `type` (string). | `map(object({value=string, type=string}))` | n/a     |   yes    |

## Outputs

| Name | Description|
|---|---|
| `parameter_names` | List of the names of the AWS SSM parameters created. |
