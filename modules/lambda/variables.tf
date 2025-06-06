variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda handler"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "filename" {
  description = "Path to deployment package"
  type        = string
} 