resource "aws_vpc" "pt-vpc" {
  cidr_block           = "100.100.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-${var.ENV}"
  }
}

resource "aws_subnet" "pt-public-subnet" {
  availability_zone_id = "use1-az1"
  cidr_block           = "100.100.10.0/24"
  vpc_id               = aws_vpc.pt-vpc.id

  tags = {
    Name = "pt-subnet (Public)"
  }
}

resource "aws_subnet" "pt-private1-subnet" {
  availability_zone_id = "use1-az1"
  cidr_block           = "100.100.20.0/24"
  vpc_id               = aws_vpc.pt-vpc.id

  tags = {
    Name = "pt-subnet (Private-1)"
  }
}

resource "aws_subnet" "pt-private2-subnet" {
  availability_zone_id = "use1-az2"
  cidr_block           = "100.100.30.0/24"
  vpc_id               = aws_vpc.pt-vpc.id

  tags = {
    Name = "pt-subnet (Private-2)"
  }
}

resource "aws_db_subnet_group" "pt-db-subnet-private-group" {
  name       = "pt-db-subnet-group-private-${var.ENV}"
  subnet_ids = [aws_subnet.pt-private1-subnet.id, aws_subnet.pt-private2-subnet.id]

  tags = {
    Name = "PositiveTech DB PrivateSubnet"
  }
}

resource "aws_internet_gateway" "pt-gw" {
  vpc_id = aws_vpc.pt-vpc.id
}

resource "aws_route_table" "allow-outgoing-access" {
  vpc_id = aws_vpc.pt-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pt-gw.id
  }

  tags = {
    Name = "Route Table Allowing Outgoing Access"
  }
}

resource "aws_route_table_association" "pt-public-subnet" {
  subnet_id      = aws_subnet.pt-public-subnet.id
  route_table_id = aws_route_table.allow-outgoing-access.id
}

resource "aws_route_table_association" "pt-private1-subnet" {
  subnet_id      = aws_subnet.pt-private1-subnet.id
  route_table_id = aws_route_table.allow-outgoing-access.id
}

resource "aws_route_table_association" "pt-private2-subnet" {
  subnet_id      = aws_subnet.pt-private2-subnet.id
  route_table_id = aws_route_table.allow-outgoing-access.id
}




