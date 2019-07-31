# Set Provider as AWS and region
provider "aws" {
    region = "eu-west-2"
}

# Defining the VPC to be used
resource "aws_vpc" "takeon-dev-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "takeon-dev-vpc"
        App = "takeon-dev-vpc"
        "kubernetes.io/cluster/Take-On-Temp" = "shared"
        "kubernetes.io/cluster/takeon-dev-eks" = "shared"
    }
}

# Defining NAT Gateway - Must be associated with public subnet

resource "aws_nat_gateway" "takeon-dev-nat" {
    allocation_id = "${aws_eip.takeon-dev-eip.id}"
    subnet_id = "${aws_subnet.takeon-dev-public-subnet.id}"

    tags = {
        Name = "takeon-dev-nat"
        App = "takeon-dev-nat"
    }
}
  
resource "aws_eip" "takeon-dev-eip" {
    vpc = true

    tags = {
        Name = "takeon-dev-eip"
        App = "takeon-dev-eip"
    }
}

# Defining Internet gateway - allows vpc to access internet
resource "aws_internet_gateway" "takeon-dev-ig" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"

    tags = {
        Name = "takeon-dev-ig"
        App = "takeon-dev-ig"
    }
}

# Defining main route table, associated with private subnet and nat gateway
resource "aws_route_table" "takeon-dev-main-routetable" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.takeon-dev-nat.id}"
    }

    tags = {
        Name = "takeon-dev-main-routetable"
        App = "takeon-dev-main-routetable"
    }
}

# Associating private subnet
resource "aws_route_table_association" "takeon-dev-main-routetable" {
    subnet_id = "${aws_subnet.takeon-dev-private-subnet.id}"
    route_table_id = "${aws_route_table.takeon-dev-main-routetable.id}"
}

# Defining secondary route table, associated with public subnet and internet gateway

resource "aws_route_table" "takeon-dev-secondary-routetable" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.takeon-dev-ig.id}"
    }

    tags = {
        Name = "takeon-dev-secondary-routetable"
        App = "takeon-dev-secondary-routetable"
    }
}

# Associating public subnet
resource "aws_route_table_association" "takeon-dev-secondary-routetable" {
    subnet_id = "${aws_subnet.takeon-dev-public-subnet.id}"
    route_table_id = "${aws_route_table.takeon-dev-secondary-routetable.id}"
}

# Creating endpoint to allow vpc to connect to S3
resource "aws_vpc_endpoint" "takeon-s3-endpoint" {
  vpc_id       = "${aws_vpc.takeon-dev-vpc.id}"
  service_name = "com.amazonaws.eu-west-2.s3"
  
  tags = {
        Name = "takeon-dev-s3-endpoint"
        App = "takeon-dev-s3-endpoint"
    }
}

# Defining subnet group for RDS
resource "aws_db_subnet_group" "takeon-dev-rds-subnetgroup" {
  name = "takeon-dev-subnet-group"
  subnet_ids = ["${aws_subnet.takeon-dev-private-subnet.id}", "${aws_subnet.takeon-dev-private-subnet2.id}"]

  tags = {
        Name = "takeon-dev-rds-subnetgroup"
        App = "takeon-dev-rds-subnetgroup"
    }
}
