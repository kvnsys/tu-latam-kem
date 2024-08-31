variable "vpc_id" {}

variable "cidr_block" {
  description = "CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-east-1a"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  default     = "main-subnet"
}