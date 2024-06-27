variable "bucket" {
  description = "Bucket name"
  type        = string
  default     = ""
}

variable "key_prefix" {
  description = "Object key"
  type        = string
  default     = ""
}

variable "filepath" {
  description = "Object source location. E.g.: 'path/to/my/website'"
  type        = string
  default     = ""
}