resource "aws_iam_role" "takeon-eks-role" {
  name = "takeon-eks-role"

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

# EKS cluster

resource "aws_eks_cluster" "takeon-dev-eks" {
    name = "takeon-dev-eks-cluster"
    role_arn = "${aws_iam_role.takeon-eks-role.arn}"

    vpc_config {
        subnet_ids = ["${aws_subnet.takeon-dev-public-subnet.id}", "${aws_subnet.takeon-dev-public-subnet2.id}", 
                      "${aws_subnet.takeon-dev-private-subnet.id}", "${aws_subnet.takeon-dev-private-subnet2.id}"]
    
    security_group_ids = ["${aws_security_group.takeon-dev-private-securitygroup.id}"]
    }


}

# Worker node configuration

resource "aws_iam_role" "takeon-dev-node-role" {
  name = "takeon-dev-node-role"

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

resource "aws_iam_role_policy_attachment" "takeon-dev-node-role-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.takeon-dev-node-role.name}"
}

resource "aws_iam_role_policy_attachment" "takeon-dev-node-role-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.takeon-dev-node-role.name}"
}

resource "aws_iam_role_policy_attachment" "takeon-dev-node-role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.takeon-dev-node-role.name}"
}

# Node Config

resource "aws_cloudformation_stack" "takeon-dev-stack" {
  name = "networking-stack"

  parameters = {
    VpcId = "${aws_vpc.takeon-dev-vpc.id}"
    ClusterControlPlaneSecurityGroup = "${aws_security_group.takeon-dev-private-securitygroup.id}"
    ClusterName = "${aws_eks_cluster.takeon-dev-eks.name}"
    KeyName = "dev-vpc-key"
    NodeAutoScalingGroupDesiredCapacity =	3
    NodeAutoScalingGroupMaxSize	= 4	
    NodeAutoScalingGroupMinSize	= 1
    NodeGroupName	= "TakeOnGroup"
    NodeImageId	= "ami-0147919d2ff9a6ad5"
    NodeInstanceType	= "t3.medium"
    NodeVolumeSize	= "20"
    Subnets	= "${aws_subnet.takeon-dev-private-subnet.id},${aws_subnet.takeon-dev-private-subnet2.id}"

  }

  template_url = "https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2019-02-11/amazon-eks-nodegroup.yaml"
}