variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "scope" {
  description = "Scope of the WAF (REGIONAL or CLOUDFRONT)"
  type        = string
} 