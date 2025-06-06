variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "service_role_arn" {
  description = "IAM role ARN for CodeBuild"
  type        = string
}

variable "environment_image" {
  description = "Docker image for build environment"
  type        = string
}

variable "source_location" {
  description = "Source location (e.g., S3 bucket)"
  type        = string
} 