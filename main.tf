# creating aws networking for a project

resource "aws_vpc" "terraform_project3" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_project3"
  }
}

# creating a public subnet1

resource "aws_subnet" "terraform_public_subnet1" {
  vpc_id            = aws_vpc.terraform_project3.id
  cidr_block        = var.sub1_cidr
  availability_zone = var.az1
  tags = {
    Name = "terraform_public_subnet"
  }  
}    


# creating a public subnet2

resource "aws_subnet" "terraform_public_subnet2" {
  vpc_id            = aws_vpc.terraform_project3.id
  cidr_block        = var.sub2_cidr
  availability_zone = var.az2

  tags = {
    Name = "terraform_public_subnet2"
  }
}

# creating a private subnet1

resource "aws_subnet" "terraform_private_subnet1" {
  vpc_id            = aws_vpc.terraform_project3.id
  cidr_block        = var.priv1_cidr
  availability_zone = var.az1

  tags = {
    Name = "terraform_private_subnet1"
  }
}

# creating a private subnet2

resource "aws_subnet" "terraform_private_subnet2" {
  vpc_id            = aws_vpc.terraform_project3.id
  cidr_block        = var.priv2_cidr
  availability_zone = var.az2

  tags = {
    Name = "terraform_private_subnet2"
  }
}

# public route table

resource "aws_route_table" "terraform_public_route_table" {
  vpc_id = aws_vpc.terraform_project3.id


  tags = {
    Name = "terraform_public_route_table"
  }
}


# private route table

resource "aws_route_table" "terraform_private_route_table" {
  vpc_id = aws_vpc.terraform_project3.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_gw_NAT.id

  }
}



# associate Public subnet1 with the public route table

resource "aws_route_table_association" "terraform-public-association1" {
  subnet_id      = aws_subnet.terraform_public_subnet1.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

# associate Public subnet2 with public route table

resource "aws_route_table_association" "terraform-public-association2" {
  subnet_id      = aws_subnet.terraform_public_subnet2.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

# associate Private subnet1 with the private route table

resource "aws_route_table_association" "terraform-private-association1" {
  subnet_id      = aws_subnet.terraform_private_subnet1.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

# associate Private subnet2 with private route table

resource "aws_route_table_association" "terraform-private-association2" {
  subnet_id      = aws_subnet.terraform_private_subnet2.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

# internet gateway

resource "aws_internet_gateway" "terraform_IGW" {
  vpc_id = aws_vpc.terraform_project3.id

  tags = {
    Name = "terraform_project3"
  }
}


# associating internet gateway to the public route table

resource "aws_route" "terraform_IGW_association" {
  route_table_id         = aws_route_table.terraform_public_route_table.id
  gateway_id             = aws_internet_gateway.terraform_IGW.id
  destination_cidr_block = "0.0.0.0/0"
  
}


# Allocate elastic ip address for the Nat gateway

resource "aws_eip" "eip_nat_gateway" {
  vpc = true
  tags = {
    Name = "eip_Terraform_Project3"
  }
}


# creating a nat Gateway

resource "aws_nat_gateway" "terraform_gw_NAT" {
  allocation_id = aws_eip.eip_nat_gateway.id 
  subnet_id     = aws_subnet.terraform_public_subnet1.id

  tags = {
    Name = "terraform_project3"
  }
}


# associating a nat Gateway to a private subnet

resource "aws_nat_gateway" "terraform_NAT_gw_association" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.terraform_private_subnet1.id
}

