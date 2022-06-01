provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "mdemiguelmor-ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "f227e6136f0f46ae49e2dc13161073b12b4574eb"
    git_file             = "terraform/simple_instance/my_ec2.tf"
    git_last_modified_at = "2022-06-01 15:47:19"
    git_last_modified_by = "manuel.demiguelmoreno@gmail.com"
    git_modifiers        = "manuel.demiguelmoreno"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "87a3e68a-531c-4e89-95b2-d6efb226874c"
  }
}

resource "aws_instance" "mdemiguelmor-web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    git_commit           = "f227e6136f0f46ae49e2dc13161073b12b4574eb"
    git_file             = "terraform/simple_instance/my_ec2.tf"
    git_last_modified_at = "2022-06-01 15:47:19"
    git_last_modified_by = "manuel.demiguelmoreno@gmail.com"
    git_modifiers        = "manuel.demiguelmoreno"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "b81e640d-3d18-432b-bd9f-95df41e244cf"
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
