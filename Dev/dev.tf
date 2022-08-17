module "pt-vpc" {
  source     = "../Modules/Network"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
}

module "instances" {
  source         = "../Modules/Instance"
  ENV            = "dev"
  vpc_id         = module.pt-vpc.vpc_id
  public_subnet = module.pt-vpc.public_subnet
}

module "db" {
  source                 = "../Modules/MySQL"
  apply-immediately      = true
  db-name                = "dbdev"
  db-subnet-group-name   = module.pt-vpc.db-subnet-group-name
  identifier             = "dbdev"
  password               = var.db-password
  publicly-accessible    = false
  username               = var.db-username
  vpc-security-group-ids = [module.instances.vpc-security-group-ids]
}