resource "aws_s3_bucket" "this" {
  bucket        = local.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = var.ownership
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = local.is_public_access_set ? 1 : 0

  bucket = aws_s3_bucket.this.id

  block_public_acls       = lookup(var.public_access, "block_public_acls", true)
  block_public_policy     = lookup(var.public_access, "block_public_policy", true)
  ignore_public_acls      = lookup(var.public_access, "ignore_public_acls", true)
  restrict_public_buckets = lookup(var.public_access, "restrict_public_buckets", true)
}