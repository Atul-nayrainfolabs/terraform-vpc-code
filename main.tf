resource "aws_vpc" "First-VPC" {
    
    cidr_block = var.vpc_cidr

    tags = {
      Name = "Terraform-vpc"
    }
  
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.First-VPC.id

    tags = {
      Name = "Terraform-Internet-gateway"
    }
  
}

resource "aws_subnet" "first-subnet" {
    
    vpc_id = aws_vpc.First-VPC.id
    cidr_block = var.first-subnet-cidr
    availability_zone = var.avavilability_zone

    tags = {
        Name = "Terraform-First-Subnet"
    }
  
}

resource "aws_subnet" "Second-subnet" {

    vpc_id = aws_vpc.First-VPC.id
    cidr_block = var.second-subnet-cidr
    availability_zone = var.avavilability_zone

    tags = {
        Name = "Terraform-second-subnet"
    }
  
}

resource "aws_route_table" "First-route-table" {
    vpc_id = aws_vpc.First-VPC.id

    route  {
        cidr_block = var.route
        gateway_id = aws_internet_gateway.ig.id
    }

    tags = {
      Name = "Terraform-route-table"
    }
  
}

resource "aws_route_table" "Second-route-table" {
    vpc_id =  aws_vpc.First-VPC.id

    route {
        cidr_block = var.route
        gateway_id = aws_internet_gateway.ig.id
    }

    tags = {
      Name = "Terraform-second-route-table"
    }
  
}

resource "aws_route_table_association" "first" {
    subnet_id = aws_subnet.first-subnet.id
    route_table_id = aws_route_table.First-route-table.id
  
}


resource "aws_route_table_association" "second" {
    subnet_id = aws_subnet.Second-subnet.id
    route_table_id = aws_route_table.Second-route-table.id
  
}