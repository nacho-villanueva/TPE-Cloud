output "api_endpoint" {
  value = aws_api_gateway_stage.this.invoke_url
}

output "main_website_endpoint" {
  value = module.s3_main_website.website_endpoint
}

output "stock_website_endpoint" {
  value = module.s3_stock_website.website_endpoint
}

output "domain" {
  value = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}
