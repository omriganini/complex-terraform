resource "aws_codebuild_project" "this" {
  name          = var.project_name
  service_role  = var.service_role_arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.environment_image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
  }
  source {
    type = "S3"
    location = var.source_location
  }
  # Add more config as needed
}