module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "subnet" {
  source = "./modules/subnet"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id

  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  az1 = var.az1
  az2 = var.az2
}

module "internet_gateway" {
  source = "./modules/internet-gateway"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "nat_gateway" {
  source = "./modules/nat-gateway"

  project_name       = var.project_name
  public_subnet_1_id = module.subnet.public_subnet_1_id
}

module "route_table" {
  source = "./modules/route-table"

  project_name        = var.project_name
  vpc_id              = module.vpc.vpc_id

  internet_gateway_id = module.internet_gateway.internet_gateway_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id

  public_subnet_1_id  = module.subnet.public_subnet_1_id
  public_subnet_2_id  = module.subnet.public_subnet_2_id
  private_subnet_1_id = module.subnet.private_subnet_1_id
  private_subnet_2_id = module.subnet.private_subnet_2_id
}

module "security_group" {
  source = "./modules/security-group"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  instance_type     = var.instance_type
  key_name          = var.key_name

  public_subnet_id  = module.subnet.public_subnet_1_id

  security_group_id = module.security_group.security_group_id
  instance_profile  = module.iam.instance_profile_name
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
}

module "rds" {
  source = "./modules/rds"

  project_name         = var.project_name

  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password

  private_subnet_1_id  = module.subnet.private_subnet_1_id
  private_subnet_2_id  = module.subnet.private_subnet_2_id

  security_group_id    = module.security_group.security_group_id
}

module "alb" {
  source = "./modules/alb"

  project_name       = var.project_name

  vpc_id             = module.vpc.vpc_id

  public_subnet_1_id = module.subnet.public_subnet_1_id
  public_subnet_2_id = module.subnet.public_subnet_2_id

  security_group_id  = module.security_group.security_group_id

  target_instance_id = module.ec2.jenkins_controller_id
}

module "route53" {
  source = "./modules/route53"

  domain_name = var.domain_name

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}