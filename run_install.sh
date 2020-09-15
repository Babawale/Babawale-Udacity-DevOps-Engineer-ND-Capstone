#!/usr/bin/env bash


#Installing Ansible
echo "Installing Ansible"
pip install --upgrade pip && pip install ansible
echo "Ansible Installed"

#Installing Tidy
echo "Installing Tidy"
sudo apt install tidy
echo "Tidy installed"

#Installing Hadolint
echo "Installing Hadolint"

sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64 &&\ 
    sudo chmod +x /bin/hadolint

echo "Hadolint Installed"


# Install Jenkins
echo "Installing Jenkins"
sudo apt-get update
sudo apt install -y default-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
echo "Jenkins Installed"
