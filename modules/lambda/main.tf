resource "aws_lambda_function" "this" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn
  filename      = var.filename
  # Add environment, VPC config, etc. as needed
}

output "function_arn" {
  value = aws_lambda_function.this.arn
} 