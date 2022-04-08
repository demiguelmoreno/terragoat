provider "aws" {
  region = "eu-central-1"
}
resource "aws_security_group" "ssh_traffic" {
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
    git_commit           = "03e0d121378e82145be249bc862689aba82cbace"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-04-08 15:12:56"
    git_last_modified_by = "mdemiguelmor@paloaltonetworks.com"
    git_modifiers        = "mdemiguelmor"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "e7dcf148-5bc4-4685-8473-3e5f5e624300"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    git_commit           = "03e0d121378e82145be249bc862689aba82cbace"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-04-08 15:12:56"
    git_last_modified_by = "mdemiguelmor@paloaltonetworks.com"
    git_modifiers        = "mdemiguelmor"
    git_org              = "demiguelmoreno"
    git_repo             = "terragoat"
    yor_trace            = "b4be3b4b-ec4b-4c08-82d0-2be0d5602c23"
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
