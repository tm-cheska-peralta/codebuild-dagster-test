output "repo_name" {
    description = "Repository name in the ECR."
    value = aws_ecr_repository.repository.name
}

output "repo_url" {
    description = "Respository URL."
    value = aws_ecr_repository.repository.repository_url
}