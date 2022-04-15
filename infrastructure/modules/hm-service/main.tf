variable "enable_services" {
  type        = bool
  default     = false
  description = "Enables the autoscaling group of EC2 and Database Instances"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id of hotel management"
}

variable "subnet_id_2a" {
  type    = string
  default = ""
}

variable "subnet_id_2b" {
  type    = string
  default = ""
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inboud connections"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP Security Group"
  }
}

resource "aws_ecr_repository" "hm_service_repo" {
  name = "hm-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_lb" "hotelmgmt_service_lb" {
  // disables elb if there are no ec2 instances being allocated
  # count           = var.enable_services ? 1 : 0
  name            = "hotelmgmt-service-lb"
  security_groups = [aws_security_group.allow_http.id]
  subnets = [
    var.subnet_id_2a,
    var.subnet_id_2b
  ]
}

output "hm_service_loadbalancer_domain" {
  value = aws_lb.hotelmgmt_service_lb.dns_name
}

output "hm_service_loadbalancer_zone_id" {
  value = aws_lb.hotelmgmt_service_lb.zone_id
}

# resource "aws_lb_listener" "https_forward" {
#   load_balancer_arn = aws_lb.hotelmgmt_service_lb.arn
#   port = 80
#   protocol = "HTTPS"
#   certificate_arn =
# }

  # access_logs {

  # }

  # health_check {
  #   healthy_threshold   = 2
  #   unhealthy_threshold = 2
  #   timeout             = 3
  #   interval            = 30
  #   target              = "HTTP:80/"
  # }

  # listener {
  #   lb_port           = 80
  #   lb_protocol       = "http"
  #   instance_port     = "80"
  #   instance_protocol = "http"
  # }
# }

# data "aws_ami" "amazon-linux-ami" {
#   owners      = ["amazon"]
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-ebs"]
#   }
# }

# resource "aws_launch_configuration" "hotelmgmt_service_launch_config" {
#   name_prefix   = "hm-service-"
#   instance_type = "t2.micro"
#   image_id      = data.aws_ami.amazon-linux-ami.id

#   security_groups = [aws_security_group.allow_http.id]

#   user_data = "./install_codedeploy_agent_aws_linux.sh"
# }

# resource "aws_placement_group" "placement_group" {
#   name     = "hm-service-pg"
#   strategy = "spread"
# }
# resource "aws_autoscaling_group" "hm_service_asg" {
#   name = "hm-service-asg"
#   max_size = 4
#   min_size = 2
#   desired_capacity = 2
#   force_delete = true
#   placement_group = aws_placement_group.placement_group.id
#   launch_configuration = aws_launch_configuration.hotelmgmt_service_launch_config.name
#   vpc_zone_identifier = [ var.subnet_id_2a, var.subnet_id_2b ]
# }

# resource "aws_s3_bucket" "hm_service_app_bucket" {
#   bucket = "runtimeterror-hm-service"
# }

# resource "aws_s3_bucket_public_access_block" "hotel_management_service_bucket_public_access_block" {
#   bucket                  = aws_s3_bucket.hm_service_app_bucket.id
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_bucket_versioning" "hotel_management_service_bucket_versioning" {
#   bucket = aws_s3_bucket.hm_service_app_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_db_instance" "hm_service_database" {
#   engine = "mysql"
#   engine_version = "8.0.28"
#   instance_class = "db.t3.micro"
#   name = "hotels"
#   username = "${terraform.env.}"
#   password = "password"

#   db_subnet_group_name =
# }
