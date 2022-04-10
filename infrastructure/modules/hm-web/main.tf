resource "aws_s3_bucket" "hotel_management_ui_bucket" {
  bucket = "runtimeterror-hotel-management-ui"

  tags = {
    Name        = "WebUI"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "hotel_management_ui_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.hotel_management_ui_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "hotel_management_ui_bucket_versioning" {
  bucket = aws_s3_bucket.hotel_management_ui_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
