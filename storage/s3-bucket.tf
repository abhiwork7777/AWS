# resource "aws_s3_bucket" "eks_bucket" {
#   bucket = var.s3_bucket_name

#   tags = {
#     Name        = var.s3_bucket_name
#     Environment = "dev"
#   }
# }
# Generate a random suffix for the bucket name
resource "random_string" "bucket_suffix" {
  length  = 8
  upper   = false
  special = false
}

# Create an S3 bucket with a randomized name
resource "aws_s3_bucket" "eks_bucket" {
  bucket = "${var.s3_bucket_name}-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "${var.s3_bucket_name}-${random_string.bucket_suffix.result}"
    Environment = "dev"
  }
}


resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.eks_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.eks_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
