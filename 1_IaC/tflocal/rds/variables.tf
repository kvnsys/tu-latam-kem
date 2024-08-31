variable "subnet_ids" {
  description = "List of Subnet IDs for the RDS"
}

variable "security_group_ids" {
  description = "List of Security Group IDs for the RDS"
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group"
  default     = "main-subnet-group"
}

variable "allocated_storage" {
  description = "The allocated storage in GBs"
  default     = 20
}

variable "engine" {
  description = "The database engine to use"
  default     = "postgres"
}

variable "engine_version" {
  description = "The version of the database engine"
  default     = "16.4"
}

variable "instance_class" {
  description = "The instance type of the RDS"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  default     = "mydatabase"
}

variable "username" {
  description = "The master username for the database"
  default     = "admin"
}

variable "password" {
  description = "The password for the master user"
}

variable "parameter_group_name" {
  description = "The parameter group to use"
  default     = "default.postgres13"
}

variable "skip_final_snapshot" {
  description = "Whether to skip a final DB snapshot before deletion"
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the RDS should be publicly accessible"
  default     = false
}
