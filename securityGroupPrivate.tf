# Defining Security Groups, must add rule to allow communication within the group itself
# private security group
resource "aws_security_group" "private-securitygroup" {
    name = "${var.environment_name}-private-securitygroup"
    vpc_id = "${aws_vpc.vpc.id}"

    # Ingress ruless
        ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.cidr_private}"]
    }

    # To access database from the Bastion
        ingress {
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        cidr_blocks = ["${aws_security_group.bastion-securitygroup.id}"]
    }

    # Egress rules
    egress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["${var.gov_wifi_ip}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.cidr_private}"]
    }

    egress {
        to_port = 443
        from_port = 443
        protocol = "TCP"
        cidr_blocks = ["${var.my_ip}"]
    }

    egress {
        to_port = 443
        from_port = 443
        protocol = "TCP"
        cidr_blocks = ["${var.gov_wifi_ip}"]
    }

    tags = {
        Name = "${var.environment_name}-private-securitygroup"
        App = "takeon"
        }
}

# Rules that depend on other groups must be added after creation
resource "aws_security_group_rule" "private-securitygroup-Ingress" {
        type = "ingress"
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        source_security_group_id = "${aws_security_group.public-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }

resource "aws_security_group_rule" "private-securitygroup-Egress" {
        type = "egress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        source_security_group_id = "${aws_security_group.public-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }


resource "aws_security_group_rule" "private-securitygroup-Ingress-Self" {
        type = "ingress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        source_security_group_id = "${aws_security_group.private-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }

resource "aws_security_group_rule" "private-securitygroup-Egress-Self" {
        type = "egress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        source_security_group_id = "${aws_security_group.private-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }

resource "aws_security_group_rule" "private-securitygroup-bastion1" {
        type = "ingress"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        source_security_group_id = "${aws_security_group.bastion-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }

resource "aws_security_group_rule" "private-securitygroup-bastion2" {
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        source_security_group_id = "${aws_security_group.bastion-securitygroup.id}"
        security_group_id = "${aws_security_group.private-securitygroup.id}"
    }
