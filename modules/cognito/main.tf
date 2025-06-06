resource "aws_cognito_user_pool" "this" {
  name = var.pool_name
}

output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
} 