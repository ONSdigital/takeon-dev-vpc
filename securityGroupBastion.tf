# Security group for the bastion instance to allow local update
resource "aws_security_group" "takeon-dev-bastion-securitygroup" {
    name = "takeon-dev-bastion-securitygroup"
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        cidr_blocks =["${var.my_ip}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        cidr_blocks = ["${var.cidr_private}"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        cidr_blocks = ["${var.cidr_private2}"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["${var.cidr_private}"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["${var.cidr_private2}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    tags = {
        Name = "takeon-dev-bastion-securitygroup"
        App = "takeon"
    }
}
