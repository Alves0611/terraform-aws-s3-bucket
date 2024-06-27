<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.22 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_objects"></a> [objects](#module\_objects) | ./modules/object | n/a |

##  Usage

```hcl
module "bucket" {
  source = "github.com/Alves0611/terraform-aws-s3-object"

  name   = "my-super-unique-bucket-name"
  acl    = "public-read"
  policy = {
    json = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid       = "PublicReadGetObject"
          Effect    = "Allow"
          Principal = "*"
          Action    = "s3:GetObject"
          Resource = [
            "arn:aws:s3:::my-super-unique-bucket-name/*",
          ]
        },
      ]
    })
  }

  versioning = {
    status = "Enabled"
  }

  # This property activates the module to upload the files to the bucket.
  filepath = "path/to/my/website/files"
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging = {
    target_bucket = module.logs.name
    target_prefix = "access/"
  }
}
```


## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | Access Control Lists. It defines which AWS accounts or groups are granted access and the type of access | `string` | `"private"` | no |
| <a name="input_filepath"></a> [filepath](#input\_filepath) | The local path where the desired files will be uploaded to the bucket | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to force destroy the bucket | `bool` | `false` | no |
| <a name="input_key_prefix"></a> [key\_prefix](#input\_key\_prefix) | Prefix to put your key(s) inside the bucket. E.g.: logs -> all files will be uploaded under logs/ | `string` | `""` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Map containing logging configuration | <pre>object({<br>    target_bucket = optional(string)<br>    target_prefix = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Bucket unique name. It can contain only numbers, letters and dashes | `string` | `null` | no |
| <a name="input_ownership"></a> [ownership](#input\_ownership) | Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced | `string` | `"BucketOwnerPreferred"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Bucket policy | <pre>object({<br>    json = string<br>  })</pre> | `null` | no |
| <a name="input_public_access"></a> [public\_access](#input\_public\_access) | Public access block configuration | <pre>object({<br>    block_public_acls       = optional(bool)<br>    block_public_policy     = optional(bool)<br>    ignore_public_acls      = optional(bool)<br>    restrict_public_buckets = optional(bool)<br>  })</pre> | `{}` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Map containing versioning configuration | <pre>object({<br>    expected_bucket_owner = optional(string)<br>    status                = optional(string)<br>    mfa                   = optional(string)<br>    mfa_delete            = optional(string)<br><br>  })</pre> | `{}` | no |
| <a name="input_website"></a> [website](#input\_website) | Map containing website configuration | <pre>object({<br>    index_document           = optional(string)<br>    error_document           = optional(string)<br>    redirect_all_requests_to = optional(string)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the S3 bucket. |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name of the S3 bucket. |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | The hosted zone ID of the S3 bucket. |
| <a name="output_name"></a> [name](#output\_name) | The name (ID) of the S3 bucket. |
| <a name="output_objects"></a> [objects](#output\_objects) | A list of filenames of objects managed by the module. |
| <a name="output_regional_domain_name"></a> [regional\_domain\_name](#output\_regional\_domain\_name) | The regional domain name of the S3 bucket. |
| <a name="output_website"></a> [website](#output\_website) | The website endpoint if configured, otherwise the bucket domain name. |
| <a name="output_website_domain"></a> [website\_domain](#output\_website\_domain) | The website domain if configured, otherwise the bucket domain name. |
<!-- END_TF_DOCS -->