variable "name" {
  description = "Bucket unique name. It can contain only numbers, letters and dashes"
  type        = string
  default     = null
}

variable "ownership" {
  description = "Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced"
  type        = string
  default     = "BucketOwnerPreferred"

  validation {
    condition     = contains(["BucketOwnerPreferred", "ObjectWriter", "BucketOwnerEnforced"], var.ownership)
    error_message = "Invalid S3 bucket ownership. Valid values are: \"BucketOwnerPreferred\", \"ObjectWriter\" or \"BucketOwnerEnforced\""
  }
}

variable "acl" {
  description = "Access Control Lists. It defines which AWS accounts or groups are granted access and the type of access"
  type        = string
  default     = "private"
}

variable "policy" {
  description = "Bucket policy"
  type = object({
    json = string
  })
  default = null
}
