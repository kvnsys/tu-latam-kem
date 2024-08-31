# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "exam-vpc"
}

# Subnet Variables
variable "subnet_cidr_block" {
  description = "CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-east-1a"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  default     = "exam-subnet-rdp"
}

# Security Group Variables
variable "sg_name" {
  description = "Name of the security group"
  default     = "rds-security-group"
}

variable "sg_description" {
  description = "Description of the security group"
  default     = "Allow inbound traffic to RDS"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks allowed for ingress"
  default     = ["0.0.0.0/0"]  # Reemplazar por valores mas adecuados a los rangos que se requieran
}

# RDS Variables
variable "db_name" {
  description = "The name of the database"
  default     = "exam-db"
}

variable "db_username" {
  description = "The master username for the database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the master user"
  default     = "yourpassword"  # Punto a mejorar, pero util para propositos basicos del examen
}

variable "db_instance_class" {
  description = "The instance type of the RDS"
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "The version of the PostgreSQL engine"
  default     = "16.4"
}

variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"  # or any other region you prefer
}

variable "lambda_name" {
  description = "The RDS database password"
  type        = string
  default     = "lambda-http-endpoint"  # name for the lambda
}

variable "api_gw_name" {
  description = "The RDS database password"
  type        = string
  default     = "lambda-http-apigw"  # name for the lambda
}