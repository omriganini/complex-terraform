variable "database_name" {
  description = "Name of the Athena database"
  type        = string
}

variable "bucket" {
  description = "S3 bucket for Athena results"
  type        = string
} 