variable "report_name" {
  description = "Name of the CUR report"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket for CUR report"
  type        = string
}

variable "s3_region" {
  description = "S3 region for CUR report"
  type        = string
}

variable "s3_prefix" {
  description = "S3 prefix for CUR report"
  type        = string
} 