# Create an S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name  # S3 bucket name
}

# Define lifecycle policies for the S3 bucket
resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.bucket  # Link to the S3 bucket

  rule {
    id     = "Move to Glacier after 90 days"
    status = "Enabled"

    transition {
      days          = 90  # Move to Glacier after 90 days
      storage_class = "GLACIER"
    }
  }

  rule {
    id     = "Delete after 90 days"
    status = "Enabled"

    expiration {
      days = 90  # Delete after 90 days
    }
  }
}

