output "s3_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket.bucket
}
