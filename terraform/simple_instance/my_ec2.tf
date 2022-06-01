provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "mdemiguelmor-ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "09fba16102dc0944873c973a02ed24f2d98b2d8a"
    git_file             = "terraform/simple_instance/my_ec2.tf"
    git_last_modified_at = "2022-06-01 16:04:08"
    git_last_modified_by = "mdemiguelmor@paloaltonetworks.com"
    git_modifiers        = "manuel.demiguelmoreno/mdemiguelmor"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "4b06981b-c7c8-44d6-8b2e-40424ded839e"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  name            = "mdemiguelmor-web_server_instance"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    git_commit           = "09fba16102dc0944873c973a02ed24f2d98b2d8a"
    git_file             = "terraform/simple_instance/my_ec2.tf"
    git_last_modified_at = "2022-06-01 16:04:08"
    git_last_modified_by = "mdemiguelmor@paloaltonetworks.com"
    git_modifiers        = "manuel.demiguelmoreno/mdemiguelmor"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "ff0a0bcd-310b-44bb-a7fa-ebc727bd626c"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
