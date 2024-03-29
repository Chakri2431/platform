# Creating VPC
resource "aws_vpc" "Project_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_tag_name
    env = var.env_name
  }
}

# Creating Public Subnets
resource "aws_subnet" "Project-subnet" {
  vpc_id = aws_vpc.Project_vpc.id
  count = length(var.cidr_pub_subnet)
  cidr_block = var.cidr_pub_subnet[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

     tags = {
    Name = "Project-subnet${count.index + 1}"
    env = var.env_name
  }
}