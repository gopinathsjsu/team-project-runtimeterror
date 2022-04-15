terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

variable "baseurl" {
  type        = string
  description = "baseurl of hosted zone"
}

variable "ui_subdomain" {
  type        = string
  description = "subdomain string for ui"
}

variable "service_subdomain" {
  type        = string
  description = "subdomain string for service"
}

variable "cloudfront_domain_name" {
  type        = string
  description = "domain name for cloudfront distribution"
}

variable "cloudfront_zone_id" {
  type        = string
  description = "hosted zone id for cloudfront distribution"
}

variable "hm_service_loadbalancer_domain" {
  type = string
  description = "hotel management service loadbalancer domain"
}

variable "hm_service_loadbalancer_zone_id" {
  type = string
  description = "hotel management service loadbalancer zone_id"
}

resource "aws_route53_zone" "main" {
  name = var.baseurl
}

# resource "aws_route53_zone" "service_subdomain" {
# name = var.service_subdomain
# }

resource "aws_route53_record" "ui_subdomain_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.ui_subdomain}.${var.baseurl}"
  type    = "A"

  alias {
    name = var.cloudfront_domain_name
    zone_id = var.cloudfront_zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "ui_cert" {
    domain_name = "${var.ui_subdomain}.${var.baseurl}"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_route53_record" "service_subdomain_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.service_subdomain}.${var.baseurl}"
  type    = "A"

  alias {
    name = var.hm_service_loadbalancer_domain
    zone_id = var.hm_service_loadbalancer_zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "service_cert" {
    domain_name = "${var.service_subdomain}.${var.baseurl}"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}

output "ui_acm_certificat_arn" {
    value = aws_acm_certificate.ui_cert.arn
}
