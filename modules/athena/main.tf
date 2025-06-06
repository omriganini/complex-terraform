resource "aws_athena_database" "this" {
  name   = var.database_name
  bucket = var.bucket
} 