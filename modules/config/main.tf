resource "aws_config_configuration_recorder" "this" {
  name     = "default"
  role_arn = var.role_arn
}