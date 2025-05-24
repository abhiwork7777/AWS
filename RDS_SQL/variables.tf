variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the initial database to create"
  type        = string
  default     = "my-database"
}

variable "db_user" {
  description = "The master username for the DB"
  type        = string
}

variable "db_password" {
  description = "The password for the DB user"
  type        = string
  sensitive   = true
}
