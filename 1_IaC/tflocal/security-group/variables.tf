variable "vpc_id" {}

variable "sg_name" {
  description = "Name of the security group"
  default     = "rds-security-group"
}

variable "sg_description" {
  description = "Description of the security group"
  default     = "Allow inbound traffic to RDS"
}

variable "ingress_from_port" {
  default = 5432
}

variable "ingress_to_port" {
  default = 5432
}

variable "ingress_protocol" {
  default = "tcp"
}

variable "ingress_cidr_blocks" {
  default = ["0.0.0.0/0"]  # Replace with a more specific CIDR if needed
}

variable "egress_from_port" {
  default = 0
}

variable "egress_to_port" {
  default = 0
}

variable "egress_protocol" {
  default = "-1"
}

variable "egress_cidr_blocks" {
  default = ["0.0.0.0/0"]
}