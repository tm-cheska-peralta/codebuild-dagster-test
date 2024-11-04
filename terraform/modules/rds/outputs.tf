output "rds_instance_id" {
  value = aws_db_instance.rds.id
}

output "rds_instance_address" {
  value = aws_db_instance.rds.address
}

output "rds_username" {
  value = var.db_username
}

output "rds_password" {
  value = var.db_password
}

output "rds_db_name" {
  value = var.db_name
}