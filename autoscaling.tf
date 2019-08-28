# resource "aws_autoscaling_group" "takeon-dev-autoscaling" {
#     desired_capacity          = 3
#     health_check_grace_period = 0
#     health_check_type         = "EC2"
#     launch_configuration      = "${aws_launch_configuration.takeon-dev-launchconfig.id}"
#     max_size                  = 5
#     min_size                  = 1
#     name                      = "takeon-dev-autoscaling"
#     vpc_zone_identifier       = ["${aws_subnet.takeon-dev-private-subnet.id}", "${aws_subnet.takeon-dev-private-subnet2.id}"]

#     tag {
#         key   = "Name"
#         value = "takeon-dev-node"
#         propagate_at_launch = true
#     }

#     tag {
#         key   = "aws:autoscaling:groupName"
#         value = "takeon-dev-autoscaling"
#         propagate_at_launch = true
#     }

#     tag {
#         key   = "kubernetes.io/cluster/takeon-dev-eks-cluster"
#         value = "owned"
#         propagate_at_launch = true
#     }

# }

# # autoscaling launch configuration

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"]
# }

# resource "aws_launch_configuration" "takeon-dev-launchconfig" {
#   name_prefix   = "takeon-dev-launchconfig-"
#   image_id      = "${data.aws_ami.ubuntu.id}"
#   instance_type = "t3.medium"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# autoscaling policy
# resource "aws_autoscaling_policy" "takeon-dev-autoscaling-policy"{
#   name = "TakeOn-Autoscaling"
#   autoscaling_group_name = "takeon-dev-autoscaling"
#   # scaling_adjustment = 1
#   policy_type = "TargetTrackingScaling"
#   adjustment_type = "ChangeInCapacity"
#   target_tracking_configuration {
#   predefined_metric_specification {
#     predefined_metric_type = "ASGAverageCPUUtilization"
#   }
#     target_value = 40.0
#   }
# }