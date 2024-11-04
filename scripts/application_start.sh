#!/bin/bash

cd /aws-codepipeline

# Load environment variables from codebuild
source ./scripts/env_vars.sh

# Retrieve environment variables
export DAGSTER_POSTGRES_HOSTNAME=$(aws ssm get-parameter --name "DAGSTER_POSTGRES_HOSTNAME" --query "Parameter.Value" --output text)
export DAGSTER_POSTGRES_USERNAME=$(aws ssm get-parameter --name "DAGSTER_POSTGRES_USERNAME" --query "Parameter.Value" --output text)
export DAGSTER_POSTGRES_PASSWORD=$(aws ssm get-parameter --name "DAGSTER_POSTGRES_PASSWORD" --with-decryption --query "Parameter.Value" --output text)
export DAGSTER_POSTGRES_DB_NAME=$(aws ssm get-parameter --name "DAGSTER_POSTGRES_DB_NAME" --query "Parameter.Value" --output text)

# Get ECR credentials
aws ecr get-login-password --region $ECR_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY
# Build and Run
sudo -E docker compose -f ci/docker-compose.yaml up -d --build