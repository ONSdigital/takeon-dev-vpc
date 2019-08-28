data "aws_ami" "bastion-ami" {
  most_recent = true
  owners = [
    "137112412989"]
  name_regex = ".*amzn2-ami-hvm-2.0.*"

  filter {
    name = "architecture"
    values = [
      "x86_64"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }
}

resource "aws_instance" "bastion" {
  ami          = "${data.aws_ami.bastion-ami.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.takeon-dev-bastion-securitygroup.id}"]
  subnet_id = "${aws_subnet.takeon-dev-public-subnet.id}"
  associate_public_ip_address = true
  key_name = "ConcDeploy"

  tags = {
    Name = "Takeon-VPC-Dev-Bastion"
    App = "takeon"
  }
}