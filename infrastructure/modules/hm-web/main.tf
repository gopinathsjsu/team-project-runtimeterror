variable alias {
  type = string
  description = "alias for ui"
}

variable acm_certificate_arn {
  type = string
  description = "certificat arn for ui"
}

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

resource "aws_cloudfront_origin_access_identity" "hotel_management_ui_oai" {
  comment = "origin access identity for hotel_management_ui_bucket"
}

data "aws_iam_policy_document" "hotel_management_ui_bucket_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.hotel_management_ui_bucket.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.hotel_management_ui_oai.iam_arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "hotel_management_ui_policy_attachment" {
  bucket = aws_s3_bucket.hotel_management_ui_bucket.id
  policy = data.aws_iam_policy_document.hotel_management_ui_bucket_policy.json
}

resource "aws_cloudfront_distribution" "hotel_management_ui_cache" {
  origin {
    domain_name = aws_s3_bucket.hotel_management_ui_bucket.bucket_regional_domain_name
    origin_id = aws_s3_bucket.hotel_management_ui_bucket.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.hotel_management_ui_oai.cloudfront_access_identity_path
    }
  }

  enabled = true
  is_ipv6_enabled = true
  comment = "Cloudfront distribution for hotel management ui"
  default_root_object = "index.html"

  custom_error_response {
    error_code = 403
    response_code = 200
    response_page_path = "/index.html"
  }

  aliases = [var.alias]

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.hotel_management_ui_bucket.id

    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 0
    max_ttl = 0

    forwarded_values {
      query_string = false

      cookies{
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["US", "CA"]
    }
  }

  viewer_certificate {
    minimum_protocol_version = "TLSv1"
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
  }

  tags = {
    Environment = "hotel-management"
  }
}

output "hm-cf-distribution" {
  value = aws_cloudfront_distribution.hotel_management_ui_cache.id
  description = "hm-web cf distribution"
}

output "hm-web-bucket" {
  value = aws_s3_bucket.hotel_management_ui_bucket.bucket
  description = "bucket name for hm-web"
}

output "hm-cf-distribution-domain-name" {
  value = aws_cloudfront_distribution.hotel_management_ui_cache.domain_name
  description = "hm-web cf distribution domain_name"
}

output "hm-cf-distribution-zone-id" {
  value = aws_cloudfront_distribution.hotel_management_ui_cache.hosted_zone_id
  description = "hm-web cf distribution zone_id"
}
