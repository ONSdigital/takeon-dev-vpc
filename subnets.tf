# Defining subnets, public and private determined by route tables, must exist in different availability zones
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.cidr_public}"
    availability_zone = "eu-west-2a"

    tags = {
        App = "takeon"
        Name = "${var.environment_name}-public-subnet"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/takeon-dev-sandbox-eks-cluster" = "shared"
    }
}

resource "aws_subnet" "public-subnet2" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.cidr_public2}"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "${var.environment_name}-public-subnet2"
        App = "takeon"
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/takeon-dev-sandbox-eks-cluster" = "shared"
    }
}

resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.cidr_private}"
    availability_zone = "eu-west-2a"
    timeouts {
        delete = "40m"
    }
    tags = {
        Name = "${var.environment_name}-private-subnet"
        App = "takeon"
        "kubernetes.io/cluster/takeon-dev-sandbox-eks-cluster" = "shared"
        "kubernetes.io/role/internal-elb" = "1"
    }
}

resource "aws_subnet" "private-subnet2" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.cidr_private2}"
    availability_zone = "eu-west-2b"
    timeouts {
        delete = "40m"
    }
    tags = {
        Name = "${var.environment_name}-private-subnet2"
        App = "takeon"
        "kubernetes.io/cluster/takeon-dev-sandbox-eks-cluster" = "shared"
        "kubernetes.io/role/internal-elb" = "1"
    }
}
