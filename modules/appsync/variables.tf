variable "api_name" {
  description = "Name of the AppSync API"
  type        = string
}

variable "cognito_user_pool_id" {
  description = "Cognito User Pool ID for authentication"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
} 