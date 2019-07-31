resource "aws_autoscaling_group" "takeon-dev-autoscaling" {
    desired_capacity          = 3
    health_check_grace_period = 0
    health_check_type         = "EC2"
    launch_configuration      = "${aws_launch_configuration.takeon-dev-launchconfig.id}"
    max_size                  = 5
    min_size                  = 1
    name                      = "takeon-dev-autoscaling"
    vpc_zone_identifier       = ["${aws_subnet.takeon-dev-private-subnet.id}", "${aws_subnet.takeon-dev-private-subnet2.id}"]

    tag {
        key   = "Name"
        value = "takeon-dev-eks-takeon-dev-node"
        propagate_at_launch = true
    }

    tag {
        key   = "aws:cloudformation:logical-id"
        value = "NodeGroup"
        propagate_at_launch = true
    }

    tag {
        key   = "aws:cloudformation:stack-id"
        value = "arn:aws:cloudformation:eu-west-2:014669633018:stack/TakeOnStack/49e63100-9e47-11e9-bf5d-063e55d03e72"
        propagate_at_launch = true
    }

    tag {
        key   = "aws:cloudformation:stack-name"
        value = "TakeOnStack"
        propagate_at_launch = true
    }

    tag {
        key   = "kubernetes.io/cluster/takeon-dev-eks"
        value = "owned"
        propagate_at_launch = true
    }

}

# autoscaling launch configuration

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_launch_configuration" "takeon-dev-launchconfig" {
  name_prefix   = "takeon-dev-launchconfig-"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "t3.medium"

  lifecycle {
    create_before_destroy = true
  }
}

# autoscaling policy

resource "aws_autoscaling_policy" "takeon-dev-autoscaling-policy" {
  name                   = "takeon-dev-autoscaling-policy"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.takeon-dev-autoscaling.name}"
}