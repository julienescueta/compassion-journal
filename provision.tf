provider "aws" {
  region     = "us-west-2"
  profile    = "cj-deployer"
}

resource "aws_instance" "cj" {
  ami           = "ami-b52674cd"
  instance_type = "t2.micro"
  key_name      = "compassionjournal-aws-key"
  vpc_security_group_ids = [
    "sg-0c88cb85e1a072ac4"
  ]
  user_data     = "${file("install-docker.sh")}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.cj.id}"
}
