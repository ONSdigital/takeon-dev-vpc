data "aws_ami" "bastion-ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "bastion" {
  ami          = "${data.aws_ami.bastion-ami.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.takeon-dev-bastion-securitygroup.id}"]
  subnet_id = "${aws_subnet.takeon-dev-public-subnet.id}"
  associate_public_ip_address = true

  tags = {
    Name = "takeon-bastion"
  }
}