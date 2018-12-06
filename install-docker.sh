#!/bin/sh
yum update
yum install -y docker
service docker start
usermod -aG docker ec2-user
docker pull julienescueta/compassionjournal
docker run -d -t --rm -p=80:80 julienescueta/compassionjournal