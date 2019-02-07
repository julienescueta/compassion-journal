#!/bin/sh
sudo yum update -y

# install docker
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -aG docker ec2-user

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

cd /home/ec2-user/cj
sudo sysctl -w vm.max_map_count=262144
sudo docker-compose up -d
