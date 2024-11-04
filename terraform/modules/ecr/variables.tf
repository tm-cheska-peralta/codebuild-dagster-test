variable "ecr_name" {
    description = "Name of the ECR repository."
    type = string
}

variable "tags" {
  description = "Default tags."
  type    = any
  default = null
}