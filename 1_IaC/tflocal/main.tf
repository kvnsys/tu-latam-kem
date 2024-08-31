resource "aws_s3_bucket" "exam-bucket" {
  bucket = "exam-bucket"
}

module "vpc" {
  source = "./vpc"

  # Passing variables to the VPC module
  cidr_block = var.vpc_cidr_block
  vpc_name   = var.vpc_name
}

module "subnet" {
  source = "./subnet"

  # Passing variables to the Subnet module
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  subnet_name       = var.subnet_name
}

module "security_group" {
  source = "./security-group"

  # Passing variables to the Security Group module
  vpc_id              = module.vpc.vpc_id
  sg_name             = var.sg_name
  sg_description      = var.sg_description
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "rds" {
  source = "./rds"

  # Passing variables to the RDS module
  subnet_ids         = [module.subnet.subnet_id]
  security_group_ids = [module.security_group.sg_id]
  db_name            = var.db_name
  username           = var.db_username
  password           = var.db_password
  instance_class     = var.db_instance_class
  engine_version     = var.db_engine_version
}

module "lambda" {
  source      = "./lambda"
  aws_region  = var.aws_region
  db_host     = module.rds.rds_endpoint
  db_port     = "5432"
  db_user     = var.db_username
  db_password = var.db_password
  lambda_name = var.lambda_name
  api_gw_name = var.api_gw_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "api_gateway_url" {
  value       = module.lambda.api_gateway_url
}