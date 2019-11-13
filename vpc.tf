# Set Provider as AWS and region
provider "aws" {
    region = "eu-west-2"
}

# Defining the VPC to be used
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "${var.environment_name}-vpc"
        App = "takeon"
        "kubernetes.io/cluster/eks-cluster" = "shared"
    }
}

# Defining NAT Gateway - Must be associated with public subnet

resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"

    tags = {
        Name = "${var.environment_name}-nat"
        App = "takeon"
    }
}

resource "aws_eip" "eip" {
    vpc = true

    tags = {
        Name = "${var.environment_name}-eip"
        App = "takeon"
    }
}

# Defining Internet gateway - allows vpc to access internet
resource "aws_internet_gateway" "ig" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags = {
        Name = "${var.environment_name}-ig"
        App = "takeon"
    }
}

# Defining main route table, associated with private subnet and nat gateway
resource "aws_route_table" "main-routetable" {
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat.id}"
    }

    tags = {
        Name = "${var.environment_name}-main-routetable"
        App = "takeon"
    }
}

# Associating private subnet
resource "aws_route_table_association" "main-routetable" {
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.main-routetable.id}"
}

# Defining secondary route table, associated with public subnet and internet gateway

resource "aws_route_table" "secondary-routetable" {
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig.id}"
    }

    tags = {
        Name = "${var.environment_name}-secondary-routetable"
        App = "takeon"
    }
}

# Associating public subnet
resource "aws_route_table_association" "secondary-routetable" {
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.secondary-routetable.id}"
}

# Creating endpoint to allow vpc to connect to S3
resource "aws_vpc_endpoint" "takeon-s3-endpoint" {
  vpc_id       = "${aws_vpc.vpc.id}"
  service_name = "com.amazonaws.eu-west-2.s3"

  tags = {
        Name = "${var.environment_name}-s3-endpoint"
        App = "takeon"
    }
}

# Defining subnet group for RDS
resource "aws_db_subnet_group" "rds-subnetgroup" {
  name = "${var.environment_name}-subnet-group"
  subnet_ids = ["${aws_subnet.private-subnet.id}", "${aws_subnet.private-subnet2.id}"]

  tags = {
        Name = "${var.environment_name}-rds-subnetgroup"
        App = "takeon"
    }
}
