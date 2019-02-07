provider "aws" {
  region     = "us-west-2"
  profile    = "cj-deployer"
}

resource "aws_instance" "cj" {
  ami           = "ami-08939e7eda6431140"
  instance_type = "t2.micro"
  key_name      = "compassionjournal-aws-key"
  vpc_security_group_ids = [
    "sg-0c88cb85e1a072ac4"
  ]
  user_data     = "${file("install-docker.sh")}"
}

resource "aws_instance" "elk" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.micro"
  key_name      = "compassionjournal-aws-key"
  vpc_security_group_ids = [
    "sg-0c88cb85e1a072ac4"
  ]
  provisioner "file" {
    source      = "/home/julien/projects/compassion-journal/docker-compose.yml"
    destination = "/home/ec2-user/docker-compose.yml"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("/home/julien/compassionjournal-aws-key.pem")}"
    }
  }
  user_data     = "${file("install-elk.sh")}"
}

resource "aws_eip" "cj-ip" {
  instance = "${aws_instance.cj.id}"
}

resource "aws_eip" "elk-ip" {
  instance = "${aws_instance.elk.id}"
}
