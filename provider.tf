# Configure the AWS provider
provider "aws" {
 region  = "us-east-1"  # Set the region
 profile = "Kodyb"
}

# Optional: Provide credentials through environment variables or hardcoded values
# environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY should be used if not hardcoded here

