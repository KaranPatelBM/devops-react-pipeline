#!/bin/bash

set -e  # Exit if any command fails

echo "🔄 Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing Java (OpenJDK 11)..."
sudo apt install -y openjdk-11-jdk

echo "🔑 Adding Jenkins repo key and source..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
echo "🚀 Installing Jenkins..."
sudo apt install -y jenkins

echo "✅ Enabling and starting Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "🎉 Jenkins setup complete. Access it at: http://<your-ec2-ip>:8080"
