# modules/rds/variables.tf
variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The database username"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}

variable "db_subnet_group" {
  description = "The subnet group for the RDS instance"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS instance"
  type        = list(string)
}
