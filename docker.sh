#!/bin/bash

echo "----- Updating system -----"
sudo apt-get update -y

echo "----- Installing required packages -----"
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "----- Installing Docker -----"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "----- Adding current user to docker group -----"
sudo usermod -aG docker $USER

echo "----- Enabling Docker to start automatically -----"
sudo systemctl enable docker

echo "----- Starting Docker service -----"
sudo systemctl start docker

echo "----- Checking Docker status -----"
sudo systemctl status docker --no-pager

echo "----- Docker Version -----"
sudo docker --version

echo "----- Docker Compose Version -----"
sudo docker compose version || sudo docker-compose --version

echo "----- DONE -----"
echo "Please LOG OUT and LOG IN again for docker group changes to apply."
