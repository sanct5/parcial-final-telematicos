#!/bin/bash
echo "update and upgrade"
sudo apt update -y

echo "installing docker"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "add Docker official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "set up the stable repository"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

echo "update the package database with the Docker packages from the newly added repo"
sudo apt update -y

echo "make sure you are about to install from the Docker repo instead of the default Ubuntu repo"
sudo apt-cache policy docker-ce

echo "install docker"
sudo apt install -y docker-ce

# Start docker without sudo
# sudo usermod -aG docker ${USER}
# su - ${USER}
# id -nG

cd /home/vagrant/dockerWebapp
sudo docker compose -f docker-compose.yml up -d
sudo docker compose ps