resource "aws_instance" "take-on-autoscaling1" {
    ami                         = "ami-0bc8d0262346bd65e"
    availability_zone           = ""
    ebs_optimized               = false
    instance_type               = "t2.medium"
    monitoring                  = true
    key_name                    = ""
    subnet_id                   = "${aws_subnet.takeon-dev-public-subnet2.id}"
    vpc_security_group_ids      = ["${aws_security_group.takeon-dev-private-securitygroup.id}"]
    associate_public_ip_address = true
    private_ip                  = "10.0.1.138"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        Name = "take-on-autoscaling"
        "kubernetes.io/cluster/takeon-dev-eks" = "owned"
        "aws:autoscaling:groupName" = "take-on-autoscaling"
    }
}
resource "aws_instance" "take-on-autoscaling2" {
    ami                         = "ami-0bc8d0262346bd65e"
    availability_zone           = ""
    ebs_optimized               = false
    instance_type               = "t2.medium"
    monitoring                  = true
    key_name                    = ""
    subnet_id                   = "${aws_subnet.takeon-dev-public-subnet.id}"
    vpc_security_group_ids      = ["${aws_security_group.takeon-dev-private-securitygroup.id}"]
    associate_public_ip_address = true
    private_ip                  = "10.0.0.141"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        "aws:autoscaling:groupName" = "take-on-autoscaling"
        Name = "take-on-autoscaling"
        "kubernetes.io/cluster/takeon-dev-eks" = "owned"
    }
}
resource "aws_instance" "takeon-dev-eks-cluster-TakeOnGroup-Node1" {
    ami                         = "ami-0147919d2ff9a6ad5"
    availability_zone           = "eu-west-2a"
    ebs_optimized               = false
    instance_type               = "t3.medium"
    monitoring                  = true
    key_name                    = "instance-test"
    subnet_id                   = "subnet-0deca1ec0e972f6fd"
    vpc_security_group_ids      = ["sg-068b9c660d5c12089"]
    associate_public_ip_address = true
    private_ip                  = "10.0.11.10"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        "aws:cloudformation:stack-id" = "arn:aws:cloudformation:eu-west-2:014669633018:stack/TakeOnStack/49e63100-9e47-11e9-bf5d-063e55d03e72"
        "aws:cloudformation:logical-id" = "NodeGroup"
        "aws:cloudformation:stack-name" = "TakeOnStack"
        Name = "takeon-dev-eks-cluster-takeon-dev-node"
        "aws:autoscaling:groupName" = "TakeOnStack-NodeGroup-VWWUFH8UX4K6"
        "kubernetes.io/cluster/takeon-dev-eks-cluster" = "owned"
    }
}
resource "aws_instance" "takeon-dev-eks-cluster-TakeOnGroup-Node2" {
    ami                         = "ami-0147919d2ff9a6ad5"
    availability_zone           = "eu-west-2a"
    ebs_optimized               = false
    instance_type               = "t3.medium"
    monitoring                  = true
    key_name                    = "instance-test"
    subnet_id                   = "subnet-0deca1ec0e972f6fd"
    vpc_security_group_ids      = ["sg-068b9c660d5c12089"]
    associate_public_ip_address = true
    private_ip                  = "10.0.11.136"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        Name = "takeon-dev-eks-cluster-takeon-dev-node"
        "kubernetes.io/cluster/takeon-dev-eks-cluster" = "owned"
        "aws:cloudformation:stack-id" = "arn:aws:cloudformation:eu-west-2:014669633018:stack/TakeOnStack/49e63100-9e47-11e9-bf5d-063e55d03e72"
        "aws:autoscaling:groupName" = "TakeOnStack-NodeGroup-VWWUFH8UX4K6"
        "aws:cloudformation:stack-name" = "TakeOnStack"
        "aws:cloudformation:logical-id" = "NodeGroup"
    }
}
resource "aws_instance" "takeon-dev-eks-cluster-TakeOnGroup-Node3" {
    ami                         = "ami-0147919d2ff9a6ad5"
    availability_zone           = "eu-west-2b"
    ebs_optimized               = false
    instance_type               = "t3.medium"
    monitoring                  = true
    key_name                    = "instance-test"
    subnet_id                   = "subnet-07cb86ea5c7e94651"
    vpc_security_group_ids      = ["sg-068b9c660d5c12089"]
    associate_public_ip_address = true
    private_ip                  = "10.0.10.147"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        "kubernetes.io/cluster/takeon-dev-eks-cluster" = "owned"
         Name = "takeon-dev-eks-cluster-takeon-dev-node"
        "aws:cloudformation:logical-id" = "NodeGroup"
        "aws:autoscaling:groupName" = "TakeOnStack-NodeGroup-VWWUFH8UX4K6"
        "aws:cloudformation:stack-id" = "arn:aws:cloudformation:eu-west-2:014669633018:stack/TakeOnStack/49e63100-9e47-11e9-bf5d-063e55d03e72"
        "aws:cloudformation:stack-name" = "TakeOnStack"
    }
}
