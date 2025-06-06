resource "aws_amplify_app" "this" {
  name = var.app_name
  # Add repository, environment variables, etc. as needed
}

output "app_arn" {
  value = aws_amplify_app.this.arn
} 