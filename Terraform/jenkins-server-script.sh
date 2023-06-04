#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y 
# installation java 
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get clean -y
sudo apt install openjdk-11-jre -y
#sudo update-alternatives --config java
# Install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins
#configuration de port de jenkins 
#sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=9999/' /etc/default/jenkins
sudo systemctl restart jenkins 

# Install AWS CLI
sudo apt-get install -y awscli

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Start Jenkins and Docker services
sudo systemctl start jenkins
sudo systemctl start docker  
sudo chmod 777 /var/run/docker.sock
# Installation de kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Vérification de l'installation
kubectl version --client