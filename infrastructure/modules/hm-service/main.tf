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

data "aws_ami" "amazon-linux-ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_configuration" "hotelmgmt_service_launch_config" {
  name_prefix   = "hm-service-"
  instance_type = "t2.micro"
  image_id      = data.aws_ami.amazon-linux-ami.id

  security_groups = [aws_security_group.allow_http.id]

  user_data = "./install_codedeploy_agent_aws_linux.sh"
}

resource "aws_elb" "hotelmgmt_service_elb" {
  // disables elb if there are no ec2 instances being allocated
  count           = var.enable_services ? 1 : 0
  name            = "hotelmgmt-service-elb"
  security_groups = [aws_security_group.allow_http.id]
  subnets = [
    var.subnet_id_2a,
    var.subnet_id_2b
  ]

  cross_zone_load_balancing = true

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}
