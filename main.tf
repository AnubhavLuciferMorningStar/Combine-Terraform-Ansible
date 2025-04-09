provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-05b75ee38ce252be4"
  instance_type = "t2.micro"
  key_name      = "as-key"
  security_groups = ["allow_ssh_http"]
  tags = {
    Name = "Anubhav-Ansible-Server"
  }
}
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  value = aws_instance.web.public_ip
     }
