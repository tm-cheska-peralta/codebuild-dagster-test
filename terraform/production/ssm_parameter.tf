module "ssm_parameter" {
  source = "../modules/ssm_parameter"

  parameters = {
    DAGSTER_POSTGRES_HOSTNAME = {
      value = module.rds.rds_instance_address
      type  = "String"
    }
    DAGSTER_POSTGRES_USERNAME = {
      value = module.rds.rds_username
      type  = "String"
    }
    DAGSTER_POSTGRES_PASSWORD = {
      value = module.rds.rds_password
      type  = "SecureString"
    }
    DAGSTER_POSTGRES_DB_NAME = {
      value = module.rds.rds_db_name
      type  = "String"
    }
  }
}