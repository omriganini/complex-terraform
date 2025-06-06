resource "aws_wafv2_web_acl" "this" {
  name        = var.name
  scope       = var.scope
  default_action {
    allow {}
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.name
    sampled_requests_enabled   = true
  }
  # Add rules as needed
}

output "web_acl_arn" {
  value = aws_wafv2_web_acl.this.arn
} 