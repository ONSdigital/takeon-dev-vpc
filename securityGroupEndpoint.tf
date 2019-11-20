resource "aws_security_group" "takeon-dev-endpoint-securitygroup" {
    name = "takeon-dev-endpoint-securitygroup"
    vpc_id = "${aws_vpc.takeon-dev-vpc.id}"

    tags = {
        Name = "takeon-dev-endpoint-securitygroup"
        App = "takeon"
        }
}

resource "aws_security_group_rule" "takeon-dev-endpoint-securitygroup-Ingress" {
        type = "ingress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        source_security_group_id = "${aws_security_group.takeon-dev-private-securitygroup.id}"
        security_group_id = "${aws_security_group.takeon-dev-endpoint-securitygroup.id}"
    }