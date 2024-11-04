output "parameter_names" {
  value = [for p in aws_ssm_parameter.parameter : p.name]
  description = "List of the names of the AWS SSM parameters created."
}
