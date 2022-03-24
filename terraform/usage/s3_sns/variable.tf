variable "bucket_name" {
  type        = string
  description = "Name of the s3 bucket"
}

variable "key" {
  type        = string
  description = "s3 bucket object key"
}

variable "file_source" {
  type        = string
  description = "s3 bucket file source path"
}

variable "email" {
  type        = string
  description = "Email for alert"
}