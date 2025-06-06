output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "web_ui_bucket_arn" {
  value = module.web_ui_bucket.bucket_arn
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
} 