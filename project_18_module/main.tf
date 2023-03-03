terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}


# Creating VPC_1
resource "aws_vpc" "project_18_vpc_1" {
  cidr_block       = var.vpc_1_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "project_18_vpc_1"
  }
}


# Creating VPC_2
resource "aws_vpc" "project_18_vpc_2" {
  cidr_block       = var.vpc_2_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "project_18_vpc_2"
  }
}


# Creating public_subnet_1
resource "aws_subnet" "project_18_prod_pub_sub_1" {
  vpc_id     = aws_vpc.project_18_vpc_1.id
  cidr_block = var.project_18_prod_pub_sub_1_cidr_block
  tags = {
    Name = "project_18_prod_pub_sub_1"
  }
}


# Creating public_subnet_2
resource "aws_subnet" "project_18_prod_pub_sub_2" {
  vpc_id     = aws_vpc.project_18_vpc_1.id
  cidr_block = var.project_18_prod_pub_sub_2_cidr_block
  tags = {
    Name = "project_18_prod_pub_sub_2"
  }
}


# Creating public_subnet_3
resource "aws_subnet" "project_18_prod_pub_sub_3" {
  vpc_id     = aws_vpc.project_18_vpc_1.id
  cidr_block = var.project_18_prod_pub_sub_3_cidr_block
  tags = {
    Name = "project_18_prod_pub_sub_3"
  }
}


# Creating private_subnet_1
resource "aws_subnet" "project_18_prod_priv_sub_1" {
  vpc_id     = aws_vpc.project_18_vpc_1.id
  cidr_block = var.project_18_prod_priv_sub_1_cidr_block
  tags = {
    Name = "project_18_prod_priv_sub_1"
  }
}

# Creating private_subnet_2
resource "aws_subnet" "project_18_prod_priv_sub_2" {
  vpc_id     = aws_vpc.project_18_vpc_1.id
  cidr_block = var.project_18_prod_priv_sub_2_cidr_block
  tags = {
    Name = "project_18_prod_priv_sub_2"
  }
}


# Creating IGW
resource "aws_internet_gateway" "project_18_prod-igw" {
  vpc_id = aws_vpc.project_18_vpc_1.id

  tags = {
    Name = "project_18_prod-igw"
  }
}


# Creating public_route_table
resource "aws_route_table" "project_18_prod_pub_route_table" {
  vpc_id = aws_vpc.project_18_vpc_1.id

  route {
    cidr_block = var.project_18_prod_pub_route_table_cidr_block
    gateway_id = aws_internet_gateway.project_18_prod-igw.id
  }

  tags = {
    Name = "proj18_prod_pub_route_table"
  }
}


# Creating NGW
resource "aws_nat_gateway" "project_18_prod-nat-gateway" {
  allocation_id = aws_eip.project_18_eip.id
  subnet_id     = aws_subnet.project_18_prod_pub_sub_1.id

  tags = {
    Name = "project_18_prod-nat-gateway"
  }
}


# Creating eip
resource "aws_eip" "project_18_eip" {
  vpc = true
}


# Creating private_route_table
resource "aws_route_table" "project_18_prod-priv-route-table" {
  vpc_id = aws_vpc.project_18_vpc_1.id

  tags = {
    Name = "project_18_prod-pub-route-table"
  }
}


# Associate Public Subnets_1 to Public Route Table
resource "aws_route_table_association" "project_18_pub_rtb" {
  subnet_id      = aws_subnet.project_18_prod_pub_sub_1.id
  route_table_id = aws_route_table.project_18_prod_pub_route_table.id
}
