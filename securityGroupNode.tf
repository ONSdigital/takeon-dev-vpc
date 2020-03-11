resource "aws_security_group" "node-securitygroup" {
    name        = "node-securitygroup"
    description = "Security group for all nodes in the cluster"
    vpc_id      = "${aws_vpc.vpc.id}"

    ingress {
        from_port       = 32099
        to_port         = 32099
        protocol        = "tcp"
        cidr_blocks     = ["${var.cidr_public}", "${var.cidr_public2}", "${var.my_ip}", "${var.cidr_node}"]
    }

    ingress {
        from_port       = 31067
        to_port         = 31067
        protocol        = "tcp"
        cidr_blocks     = ["${var.cidr_public}", "${var.cidr_public2}", "${var.my_ip}", "${var.cidr_node}"]
    }

    ingress {
        from_port       = 1025
        to_port         = 65535
        protocol        = "tcp"
        security_groups = ["${aws_security_group.private-securitygroup.id}"]
        self            = false
    }

    ingress {
        from_port       = 3
        to_port         = 4
        protocol        = "icmp"
        cidr_blocks     = ["${var.cidr_public}", "${var.cidr_public2}", "${var.my_ip}"]
    }

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        security_groups = ["${aws_security_group.private-securitygroup.id}"]
        self            = false
    }

    ingress {
        from_port       = 31060
        to_port         = 31060
        protocol        = "tcp"
        cidr_blocks     = ["${var.cidr_public}", "${var.cidr_public2}", "${var.my_ip}", "${var.cidr_node}"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "takeon-nodes"
        App = "takeon"
        "aws:cloudformation:stack-id" = "${aws_cloudformation_stack.node-stack.id}"
        #"aws:cloudformation:stack-id" = "arn:aws:cloudformation:eu-west-2:${var.accountID}:stack/takeon-dev-sandbox-node-stack/0c614590-5dfa-11ea-b14c-021679f87d94"
        #"aws:cloudformation:stack-name" = "takeon-dev-sandbox-node-stack"
        "aws:cloudformation:stack-name" = "${aws_cloudformation_stack.node-stack.name}"
        "aws:cloudformation:logical-id" = "NodeSecurityGroup"
        "kubernetes.io/cluster/${aws_eks_cluster.eks.name}" = "owned"
    }
}
