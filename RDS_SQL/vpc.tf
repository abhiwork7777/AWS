resource "aws_vpc" "rds_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "rds-vpc"
  }
}

resource "aws_subnet" "rds_subnet_1" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "rds-subnet-1"
  }
}

resource "aws_subnet" "rds_subnet_2" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "rds-subnet-2"
  }
}

# Add Internet Gateway
resource "aws_internet_gateway" "rds_igw" {
  vpc_id = aws_vpc.rds_vpc.id

  tags = {
    Name = "rds-igw"
  }
}

# Add Route Table
resource "aws_route_table" "rds_public_rt" {
  vpc_id = aws_vpc.rds_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rds_igw.id
  }

  tags = {
    Name = "rds-public-rt"
  }
}

# Associate Route Table with Subnets
resource "aws_route_table_association" "rds_subnet_1_assoc" {
  subnet_id      = aws_subnet.rds_subnet_1.id
  route_table_id = aws_route_table.rds_public_rt.id
}

resource "aws_route_table_association" "rds_subnet_2_assoc" {
  subnet_id      = aws_subnet.rds_subnet_2.id
  route_table_id = aws_route_table.rds_public_rt.id
}
