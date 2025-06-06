resource "aws_cur_report_definition" "this" {
  report_name = var.report_name
  time_unit   = "DAILY"
  format      = "textORcsv"
  compression = "GZIP"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket   = var.s3_bucket
  s3_region   = var.s3_region
  s3_prefix   = var.s3_prefix
}

output "report_name" {
  value = aws_cur_report_definition.this.report_name
} 