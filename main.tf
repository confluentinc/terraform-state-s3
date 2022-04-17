# This is a tf module for managing the s3 bucket and dynamodb table for the terraform state store.
# The state for this tf should be stored in git.

resource "aws_s3_bucket" "terraform" {
  bucket = "${var.s3_bucket}"

  tags {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.env}"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform" {
  name           = "${var.dynamodb_table}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
