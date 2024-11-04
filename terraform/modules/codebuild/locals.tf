locals {
    default_env_vars = [
        {
            name  = "ECR_REGION"
            value = var.region
        },
        {
            name  = "ECR_REGISTRY"
            value = "${data.aws_caller_identity.me.account_id}.dkr.ecr.${var.region}.amazonaws.com"
        }
    ]

    all_env_vars = concat(local.default_env_vars, var.env_vars)
}