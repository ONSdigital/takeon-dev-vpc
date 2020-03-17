#IAM role and policy to allow the EKS service to manage or retrieve data from other AWS services
resource "aws_iam_role" "takeon-eks-role" {
  name = "${var.environment_name}-eks-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "take-on-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.takeon-eks-role.name}"
}

resource "aws_iam_role_policy_attachment" "take-on-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.takeon-eks-role.name}"
}

resource "aws_iam_role_policy_attachment" "take-on-cluster-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.takeon-eks-role.name}"
}

variable "eks_cluster_enabled_logs" {
  type        = list(string)
  description = "A list of enabled cluster logs. Allowed types are api, audit , authenticator , controllerManager,scheduler"
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

# EKS cluster

resource "aws_eks_cluster" "eks" {
    name = "${var.environment_name}-eks-cluster"
    role_arn = "${aws_iam_role.takeon-eks-role.arn}"
    enabled_cluster_log_types = "${var.eks_cluster_enabled_logs}"

    vpc_config {
        subnet_ids = ["${aws_subnet.public-subnet.id}", "${aws_subnet.public-subnet2.id}",
                      "${aws_subnet.private-subnet.id}", "${aws_subnet.private-subnet2.id}"]

    security_group_ids = ["${aws_security_group.private-securitygroup.id}"]
    }


}


# Worker node configuration

resource "aws_iam_role" "node-role" {
  name = "${var.environment_name}-node-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "node-role-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.node-role.name}"
}

resource "aws_iam_role_policy_attachment" "node-role-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.node-role.name}"
}

resource "aws_iam_role_policy_attachment" "node-role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.node-role.name}"
}

# Node Config

resource "aws_cloudformation_stack" "node-stack" {
  name = "${var.environment_name}-node-stack"
  capabilities = ["CAPABILITY_IAM"]

  parameters = {
    VpcId = "${aws_vpc.vpc.id}"
    ClusterControlPlaneSecurityGroup = "${aws_security_group.private-securitygroup.id}"
    ClusterName = "${aws_eks_cluster.eks.name}"
    KeyName = "takeon-dev-vpc-key"
    NodeAutoScalingGroupDesiredCapacity =	2
    NodeAutoScalingGroupMaxSize	= 5
    NodeAutoScalingGroupMinSize	= 0
    NodeGroupName	= "TakeOnGroup"
    NodeImageId	= "ami-0147919d2ff9a6ad5"
    NodeInstanceType	= "t3.medium"
    Subnets	= "${aws_subnet.private-subnet.id},${aws_subnet.private-subnet2.id}"


  }

  template_url = "https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2019-02-11/amazon-eks-nodegroup.yaml"

  # template_url = "https://takeon-cloudformation-template.s3.eu-west-2.amazonaws.com/amazon-eks-nodegroup.yaml"
}
