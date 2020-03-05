# data "aws_iam_group" "AllowTakeonBastionAccess" {
#     group_name = "AllowTakeonBastionAccess"
# }

resource "aws_iam_group" "AllowTakeonBastionAccess" {
     name = "AllowTakeonBastionAccess"
}

resource "aws_iam_policy" "BastionAccess" {
    name = "${var.environment_name}BastionAccess"
    description = "Allows users from Takeon group access to the Bastion"
    # policy = "${data.aws_iam_policy_document.Bastion}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "BastionAccess",
            "Effect": "Allow",
            "Action": "ec2-instance-connect:SendSSHPublicKey",
            "Resource": "arn:aws:ec2:eu-west-2:${var.accountID}:instance/${aws_instance.bastion.id}",
            "Condition": {
                "StringEquals": {
                    "ec2:osuser": "ec2-user"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:DescribeInstances",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "attach_bastion_policy" {
  group = aws_iam_group.AllowTakeonBastionAccess.name
  policy_arn = aws_iam_policy.BastionAccess.arn
}
