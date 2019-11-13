# resource "aws_autoscaling_group" "autoscaling" {
#     desired_capacity          = 3
#     health_check_grace_period = 0
#     health_check_type         = "EC2"
#     launch_configuration      = "${aws_launch_configuration.launchconfig.id}"
#     max_size                  = 5
#     min_size                  = 1
#     name                      = "autoscaling"
#     vpc_zone_identifier       = ["${aws_subnet.private-subnet.id}", "${aws_subnet.private-subnet2.id}"]

#     tag {
#         key   = "Name"
#         value = "node"
#         propagate_at_launch = true
#     }

#     tag {
#         key   = "aws:autoscaling:groupName"
#         value = "autoscaling"
#         propagate_at_launch = true
#     }

#     tag {
#         key   = "kubernetes.io/cluster/eks-cluster"
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

# resource "aws_launch_configuration" "launchconfig" {
#   name_prefix   = "launchconfig-"
#   image_id      = "${data.aws_ami.ubuntu.id}"
#   instance_type = "t3.medium"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# autoscaling policy
# resource "aws_autoscaling_policy" "autoscaling-policy"{
#   name = "TakeOn-Autoscaling"
#   autoscaling_group_name = "${var.environment_name}-autoscaling"
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