resource "aws_cognito_user_pool" "this" {
  name = var.pool_name
}