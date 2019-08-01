# Defining subnets, public and private determined by route tables, must exist in different availability zones
resource "aws_subnet" "takeon-dev-public-subnet" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    cidr_block = "${var.cidr_public}"
    availability_zone = ""

    tags = {
        Name = "takeon-dev-public-subnet"
        "kubernetes.io/cluster/Take-On-Temp" = "shared"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/takeon-dev-eks" = "owned"
    }
}
    
resource "aws_subnet" "takeon-dev-public-subnet2" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    cidr_block = "${var.cidr_public2}"
    availability_zone = ""

    tags = {
        Name = "takeon-dev-public-subnet2"
        App = "takeon-dev-public-subnet2"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/Take-On-Temp" = "shared"
        "kubernetes.io/cluster/takeon-dev-eks" = "owned"
    }
}

resource "aws_subnet" "takeon-dev-private-subnet" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    cidr_block = "${var.cidr_private}"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "takeon-dev-private-subnet"
        App = "takeon-dev-private-subnet"
        "kubernetes.io/cluster/takeon-dev-eks" = "shared"
        "kubernetes.io/cluster/Take-On-Temp" = "shared"
        "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "takeon-dev-private-subnet2" {
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"
    cidr_block = "${var.cidr_private2}"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "takeon-dev-private-subnet2"
        App = "takeon-dev-private-subnet2"
        "kubernetes.io/cluster/Take-On-Temp" = "shared"
        "kubernetes.io/cluster/takeon-dev-eks" = "shared"
        "kubernetes.io/role/elb" = "1"
    }
}
