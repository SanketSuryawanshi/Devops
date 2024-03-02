#!/bin/bash

# Getting System Packages update >>
sudo apt update

# Installing Java JDK-17 >>
sudo apt install fontconfig openjdk-17-jre

# Adding jenkins Repositery key >>
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repositery to system >> 	
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Again update the System >>
sudo apt-get update

# Install Jenkins required files >>
sudo apt-get install jenkins

# Start Jenkins Service >>
sudo systemctl start jenkins

# Retrieve initial admin password
echo "Waiting for initial admin password..."
until [ -f "/var/lib/jenkins/secrets/initialAdminPassword" ]; do
    sleep 1
done

echo "Initial admin password found:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword 
