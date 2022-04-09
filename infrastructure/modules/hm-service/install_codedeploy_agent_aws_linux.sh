#!/bin/bash

# update package manager and get dependencies
sudo yum update
sudo yum install ruby
sudo yum install wget

# clear any cached info potential
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y

# download the install script and install the agent
cd /home/ec2-user
wget https://bucket-name.s3.region-identifier.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo service codedeploy-agent status
