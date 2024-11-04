terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "dpd-de-sandbox-tf-state-staging-cheska-codebuild-test"
    key            = "aws/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "dwh-terraform-lock-staging-cheska-codebuild-test"
    profile        = "staging-account-cheska-codebuild-test"
  }
}
