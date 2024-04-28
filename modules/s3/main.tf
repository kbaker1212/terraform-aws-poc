# Create an S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name  # S3 bucket name
}

# Define lifecycle policies for the S3 bucket
resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.bucket  # Link to the S3 bucket

  rule {
    id     = "Move Images to Glacier after 90 days"
    status = "Enabled"

    filter {
      prefix = "Images/"  # Apply to objects in the "Images" folder
    }

    transition {
      days          = 90  # Move to Glacier after 90 days
      storage_class = "GLACIER"
    }
  }

  rule {
    id     = "Delete Logs after 90 days"
    status = "Enabled"

    filter {
      prefix = "Logs/"  # Apply to objects in the "Logs" folder
    }

    expiration {
      days = 90  # Delete objects after 90 days
    }
  }
}

# Marker object for "Images" folder
resource "aws_s3_object" "images_marker" {
  bucket  = aws_s3_bucket.s3_bucket.bucket
  key     = "Images/marker.txt"  # Creates a marker object in "Images" folder
  content = "This is a marker object for the Images folder"
}

# Marker object for "Logs" folder
resource "aws_s3_object" "logs_marker" {
  bucket  = aws_s3_bucket.s3_bucket.bucket
  key     = "Logs/marker.txt"  # Creates a marker object in "Logs" folder
  content = "This is a marker object for the Logs folder"
}

