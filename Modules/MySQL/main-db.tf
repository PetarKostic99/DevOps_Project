resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated-storage
  storage_type           = var.storage-type
  engine                 = var.engine
  engine_version         = var.engine-version
  instance_class         = var.instance-class
  publicly_accessible    = var.publicly-accessible
  identifier             = var.identifier
  name                   = var.db-name
  db_subnet_group_name   = var.db-subnet-group-name
  apply_immediately      = var.apply-immediately
  username               = var.username
  password               = var.password
  vpc_security_group_ids = var.vpc-security-group-ids
  skip_final_snapshot    = var.skip-final-snapshot
}