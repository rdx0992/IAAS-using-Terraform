# Regiion selection
provider "aws" {
   region = "us-east-1"
 }
# Vpc creation
resource "aws_vpc" "myVPC" {
  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway creation
resource "aws_internet_gateway" "myIGW" {

  vpc_id = aws_vpc.myVPC.id
  tags = {
    "Name" = var.igw_tag
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                          = aws_vpc.myVPC.id
  cidr_block                      = var.public_subnets_cidr_1
  availability_zone               = data.aws_availability_zones.available_1.names[0]
  map_public_ip_on_launch         = var.map_public_ip_on_launch

  tags = {
   Name = var.public_subnet_tag_1
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id                          = aws_vpc.myVPC.id
  cidr_block                      = var.public_subnets_cidr_2
  availability_zone               = data.aws_availability_zones.available_1.names[1]
  map_public_ip_on_launch         = var.map_public_ip_on_launch

  tags = {
   Name = var.public_subnet_tag_2
  }
}