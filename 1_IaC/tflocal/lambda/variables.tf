variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "db_host" {
  description = "The RDS database host"
  type        = string
}

variable "db_port" {
  description = "The RDS database port"
  type        = string
}

variable "db_user" {
  description = "The RDS database username"
  type        = string
}

variable "db_password" {
  description = "The RDS database password"
  type        = string
}

variable "lambda_name" {
  description = "The RDS database password"
  type        = string
}

variable "api_gw_name" {
  description = "The RDS database password"
  type        = string
}