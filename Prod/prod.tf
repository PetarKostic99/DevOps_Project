module "pt-vpc" {
  source     = "../Modules/Network"
  ENV        = "prod"
  AWS_REGION = var.AWS_REGION
}

module "instances" {
  source         = "../Modules/Instance"
  ENV            = "prod"
  vpc_id         = module.pt-vpc.vpc_id
  public_subnet = module.pt-vpc.public_subnet
}

module "db" {
  source                 = "../Modules/MySQL"
  apply-immediately      = true
  db-name                = "dbprod"
  db-subnet-group-name   = module.pt-vpc.db-subnet-group-name
  identifier             = "dbprod"
  password               = var.db-password
  publicly-accessible    = false
  username               = var.db-username
  vpc-security-group-ids = [module.instances.vpc-security-group-ids]
}