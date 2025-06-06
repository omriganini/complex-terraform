variable "name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy JSON"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach"
  type        = list(string)
  default     = []
} 