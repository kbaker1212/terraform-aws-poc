# Output the S3 bucket name
output "bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}

