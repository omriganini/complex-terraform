resource "aws_appsync_graphql_api" "this" {
  name                = var.api_name
  authentication_type = "AMAZON_COGNITO_USER_POOLS"
  user_pool_config {
    user_pool_id = var.cognito_user_pool_id
    aws_region   = var.aws_region
    default_action = "ALLOW"
  }
}

output "api_id" {
  value = aws_appsync_graphql_api.this.id
} 