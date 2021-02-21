# provider "postgresql" {
#       host            = "postgres_server_ip"
#   port            = 5432
#   database        = "postgres"
#   username        = "postgres_user"
#   password        = "postgres_password"
#   sslmode         = "disable"
#   connect_timeout = 15
# }

#
# RDS resources
#
resource "aws_db_instance" "postgresql" {
  allocated_storage               = var.allocated_storage
  engine                          = "postgres"
  engine_version                  = var.engine_version
  identifier                      = "rds-pg-1"
  snapshot_identifier             = var.snapshot_identifier
  instance_class                  = var.instance_type
  storage_type                    = var.storage_type
  iops                            = var.iops
  name                            = "trainingdb1"
  password                        = random_password.password.result
  username                        = "postgres"
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.backup_window
  maintenance_window              = var.maintenance_window
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade
  final_snapshot_identifier       = var.final_snapshot_identifier
  skip_final_snapshot             = var.skip_final_snapshot
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  multi_az                        = false
  port                            = var.database_port
  #vpc_security_group_ids          = [aws_security_group.postgresql.id]
  #db_subnet_group_name            = var.subnet_group
  parameter_group_name            = var.parameter_group
  storage_encrypted               = var.storage_encrypted
  deletion_protection             = var.deletion_protection

  tags = merge(
    {
      Name        = "DatabaseServer",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}

locals {
  database_name = "training-pg"
  database_identifier = random_string.suffix.result
}