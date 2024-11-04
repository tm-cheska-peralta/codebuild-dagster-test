resource "aws_ssm_parameter" "parameter" {
  for_each = var.parameters

  name  = each.key
  type  = each.value.type
  value = each.value.value
}