#!/bin/bash

sudo apt update
sudo apt install wget curl git -y
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker