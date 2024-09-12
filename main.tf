# main.tf
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source      = "./modules/ec2"
  ami_id       = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  subnet_id    = module.vpc.public_subnet_id
}

module "rds" {
  source = "./modules/rds"
  db_name             = "mydb"
  db_username         = "admin"
  db_password         = "password"
  security_group_id   = module.security.security_group_id
  db_subnet_group     = "mydb_subnet_group"
}
