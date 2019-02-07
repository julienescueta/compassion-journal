#!/bin/sh
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -aG docker ec2-user
docker pull julienescueta/compassionjournal
docker run -d -t --rm -p=80:80 julienescueta/compassionjournal
