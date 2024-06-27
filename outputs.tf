output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "The Amazon Resource Name (ARN) of the S3 bucket."
}

output "name" {
  value       = aws_s3_bucket.this.id
  description = "The name (ID) of the S3 bucket."
}

output "regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
  description = "The regional domain name of the S3 bucket."
}

output "domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The domain name of the S3 bucket."
}

output "website" {
  value       = local.is_website_set ? aws_s3_bucket_website_configuration.this[0].website_endpoint : aws_s3_bucket.this.bucket_domain_name
  description = "The website endpoint if configured, otherwise the bucket domain name."
}

output "website_domain" {
  value       = local.is_website_set ? aws_s3_bucket_website_configuration.this[0].website_domain : aws_s3_bucket.this.bucket_domain_name
  description = "The website domain if configured, otherwise the bucket domain name."
}

output "hosted_zone_id" {
  value       = aws_s3_bucket.this.hosted_zone_id
  description = "The hosted zone ID of the S3 bucket."
}

output "objects" {
  value       = [for filename, data in module.objects : filename]
  description = "A list of filenames of objects managed by the module."
}
