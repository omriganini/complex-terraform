variable "service_name" {
  description = "Name of the Fargate service"
  type        = string
}

variable "cluster_arn" {
  description = "ECS cluster ARN"
  type        = string
}

variable "task_definition_arn" {
  description = "Task definition ARN"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
} 