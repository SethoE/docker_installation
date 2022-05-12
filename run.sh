#!/bin/bash

# Delete previous or old docker installtions

sudo apt-get remove docker docker-engine docker.io containerd runc

# Update
sudo apt-get update

# Install packagess
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Repository

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and add Docker
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io