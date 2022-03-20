resource "aws_s3_bucket" "hotel_management_ui_bucket" {
    bucket = "runtimeterror_hotel_management_ui"
    acl = "private"

    versioning {
        enabled = true
    }
}

resource "aws_s3_account_public_access_block" "hotel_management_ui_bucket_public_access_block" {
    bucket = aws_s3_bucket.hotel_management_ui_bucket

    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}
