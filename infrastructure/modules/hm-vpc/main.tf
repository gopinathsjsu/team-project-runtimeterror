resource "aws_vpc" "hotelmgmt_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Hotel Management VPC"
  }
}

resource "aws_subnet" "public_us_west_2a" {
  vpc_id            = aws_vpc.hotelmgmt_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "Public Subnet us-west-2a"
  }
}

resource "aws_subnet" "public_us_west_2b" {
  vpc_id            = aws_vpc.hotelmgmt_vpc.id
  cidr_block        = "10.0.1.0/24"
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
  subnet_id      = aws_subnet.public_us_west_2a.id
  route_table_id = aws_route_table.hotelmgmt_vpc_public.id
}

resource "aws_route_table_association" "hotelmgmt_vpc_us_west_2b_public" {
  subnet_id      = aws_subnet.public_us_west_2b.id
  route_table_id = aws_route_table.hotelmgmt_vpc_public.id
}

output "vpc_id" {
  value       = aws_vpc.hotelmgmt_vpc.id
  description = "vpc id of hotel management apps vpc"
}

output "subnet_id_2a" {
  value       = aws_subnet.public_us_west_2a.id
  description = "subnet id of hotel mgmt avail zone 2a"
}

output "subnet_id_2b" {
  value       = aws_subnet.public_us_west_2b.id
  description = "subnet id of hotel mgmt avail zone 2b"
}
