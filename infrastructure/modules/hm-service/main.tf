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

variable "service_alb_certificate_arn" {
  type = string
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

resource "aws_acm_certificate" "service_cert" {
    domain_name = "hm-service.awesomepossum.dev"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}

// here
resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = aws_lb.hotelmgmt_service_lb.arn
  port              = 80
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.service_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
  depends_on = [
    aws_acm_certificate.service_cert
  ]
}

resource "aws_lb_target_group" "lb_target_group" {
  name        = "hm-service-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/api/hotel"
    unhealthy_threshold = "2"
  }
}

data "aws_iam_policy_document" "ecs_iam_policy" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "hm-service-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_iam_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_iam_policy_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "template_file" "task_definition" {
  template = file("./modules/hm-service/hm-service.json.tpl")
  vars = {
    aws_ecr_repository = aws_ecr_repository.hm_service_repo.repository_url
    tag                = "latest"
    app_port           = 80
  }
}

resource "aws_ecs_task_definition" "service_task" {
  family                   = "hm-service-task"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 2048
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.task_definition.rendered
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "hm-service-ecs-cluster"
}

resource "aws_ecs_service" "ecs_service" {
  name            = "hm-service-ecs-service"
  cluster         = resource.aws_ecs_cluster.ecs_cluster.id
  task_definition = resource.aws_ecs_task_definition.service_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.allow_http.id]
    subnets          = [var.subnet_id_2a, var.subnet_id_2b]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = resource.aws_lb_target_group.lb_target_group.arn
    container_name   = "hm-service"
    container_port   = 80
  }

  depends_on = [resource.aws_lb_listener.https_forward, resource.aws_iam_role_policy_attachment.ecs_iam_policy_attachment]

  lifecycle {
    ignore_changes = [desired_count]
  }
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "awslogs-hm-service"
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
