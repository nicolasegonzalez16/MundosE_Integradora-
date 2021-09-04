provider "aws" {
    version = "~>2.7"
    region = "us-east-2"
}

resource "aws_instance" "web" {
  count = 2
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.micro"

  tags = {
    Name = "MundosE-2103-${count.index}"
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}