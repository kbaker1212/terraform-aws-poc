# Use an S3 backend for remote state management
terraform {
  backend "s3" {
    profile = "Kodyb"
    bucket = "9911techpoc"  # S3 bucket for the backend
    key    = "terraform.tfstate"            # Key for the state file
    region = "us-east-1"                    # AWS region
  }
}

