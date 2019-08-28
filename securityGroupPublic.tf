# public Security Group
resource "aws_security_group" "takeon-dev-public-securitygroup" {
  name = "takeon-dev-public-securitygroup"
  vpc_id = "${aws_vpc.takeon-dev-vpc.id}"

    # Ingress rules
    ingress {
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks = ["${var.my_ip}"]
    }

    ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      security_groups = ["${aws_security_group.takeon-dev-bastion-securitygroup.id}"]
    }

    ingress {
      from_port = 3389
      to_port = 3389
      protocol = "TCP"
      cidr_blocks = ["${var.my_ip}"]
    }

    ingress {
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["${var.my_ip}"]
    }

    # Egress rules
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

    tags ={
        Name = "takeon-dev-public-securitygroup"
        App = "takeon"
        }
    }

resource "aws_security_group_rule" "takeon-dev-public-securitygroup-Ingress" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = "${aws_security_group.takeon-dev-private-securitygroup.id}"
    security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
    }

resource "aws_security_group_rule" "takeon-dev-public-securitygroup-Egress" {
    type = "egress"
    from_port = 5432
    to_port = 5432
    protocol = "TCP"
    source_security_group_id = "${aws_security_group.takeon-dev-private-securitygroup.id}"
    security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
}

resource "aws_security_group_rule" "takeon-dev-public-securitygroup-Ingress-Self" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    source_security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
    security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
}

resource "aws_security_group_rule" "takeon-dev-public-securitygroup-Egress-Self" {
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "-1"
    source_security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
    security_group_id = "${aws_security_group.takeon-dev-public-securitygroup.id}"
}