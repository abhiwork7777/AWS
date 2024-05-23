resource "aws_iam_role" "s3_role" {
  name               = "s3_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}
 
resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  description = "Policy to allow S3 bucket operations"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:PutBucketPolicy",
        "s3:PutBucketEncryption",
        "s3:PutBucketVersioning"
      ],
      "Resource": "arn:aws:s3:::terraform_state"
    }]
  })
}
 
resource "aws_iam_role_policy_attachment" "s3_role_attachment" {
  role       = aws_iam_role.s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
 
resource "aws_s3_bucket" "terraform-state-backup-11" {
  bucket = "terraform-state-backup-11"
  acl    = "private"  # Adjust ACL as needed
  tags   = {
    Name        = "TerraformStateBucket"
    Environment = "Production"
  }
}