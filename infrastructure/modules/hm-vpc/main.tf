variable "enable_services" {
    type = bool
    default = false
    description = "Enables the autoscaling group of EC2 and Database Instances"
}

resource "aws_vpc" "hotelmgmt_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "Hotel Management VPC"
    }
}

resource "aws_subnet" "public_us_west_2a" {
    vpc_id = aws_vpc.hotelmgmt_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-2a"

    tags = {
        Name = "Public Subnet us-west-2a"
    }
}

resource "aws_subnet" "public_us_west_2b" {
    vpc_id = aws_vpc.hotelmgmt_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2b"

    tags = {
        Name = "Public Subnet us-west-2b"
    }
}

resource "aws_internet_gateway" "hotelmgmt_vpc_igw" {
    vpc_id = aws_vpc.hotelmgmt_vpc.id

    tags = {
        Name = "Public Subnets Internet Gatway for Hotel Management VPC"
    }
}

resource "aws_route_table" "hotelmgmt_vpc_public" {
    vpc_id = aws_vpc.hotelmgmt_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.hotelmgmt_vpc_igw.id
    }

    tags = {
        Name = "Public Subnets Route Table for Hotel Management VPC"
    }
}

resource "aws_route_table_association" "hotelmgmt_vpc_us_west_2a_public" {
    subnet_id = aws_subnet.public_us_west_2a.id
    route_table_id = aws_route_table.hotelmgmt_vpc_public.id
}

resource "aws_route_table_association" "hotelmgmt_vpc_us_west_2b_public" {
    subnet_id = aws_subnet.public_us_west_2b.id
    route_table_id = aws_route_table.hotelmgmt_vpc_public.id
}

resource "aws_security_group" "allow_http" {
    name = "allow_http"
    description = "Allow HTTP inboud connections"
    vpc_id = aws_vpc.hotelmgmt_vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Allow HTTP Security Group"
    }
}

data "aws_ami" "amazon-linux-ami" {
    owners = ["amazon"]
    most_recent = true

    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
}

resource "aws_launch_configuration" "hotelmgmt_service_launch_config" {
    name_prefix = "hm-service-"
    instance_type = "t2.micro"
    image_id = data.aws_ami.amazon-linux-ami.id

    security_groups = [ aws_security_group.allow_http.id ]

    # need to implement the launch configuration to pull artifacts from somewhere and run the application
}

resource "aws_elb" "hotelmgmt_service_elb" {
    // disables elb if there are no ec2 instances being allocated
    count = var.enable_services ? 1 : 0
    name = "hotelmgmt-service-elb"
    security_groups = [ aws_security_group.allow_http.id ]
    subnets = [
        aws_subnet.public_us_west_2a.id,
        aws_subnet.public_us_west_2b.id
    ]

    cross_zone_load_balancing = true

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        target = "HTTP:80/"
    }

    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = "80"
        instance_protocol = "http"
    }
}
