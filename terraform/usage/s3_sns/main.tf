module "s3" {
  source      = "../../module/s3"
  bucket_name = var.bucket_name
  key         = var.key
  file_source = var.file_source
}

module "sns" {
  source      = "../../module/sns"
  email       = var.email
  s3_id       = module.s3.s3_id
  bucket_name = var.bucket_name
}