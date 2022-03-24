resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "s3_bucket_object" {
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
  bucket = var.bucket_name
  key    = var.key
  source = var.file_source

}