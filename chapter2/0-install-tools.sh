#!/bin/bash
clear

# Most of the coding segments in the book have been removed to make room for additional technical contact.  Scripts will now
# contain more documentation to help users understand what the scripts are executing.
tput setaf 3
echo -e "*******************************************************************************************************************"
echo -e "Installing KinD Cluster"
echo -e "*******************************************************************************************************************"

# Download the version of KinD that all exercises have been tested with - Any version of KinD other than v0.19.0 may not work
# with the exercies in the book due to breaking changes and compatibility with the Kubernetes versions.
tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Downloading the KinD v0.22.0 Binary"
echo -e "All of the exercises in the book have been tested against KinD v0.22.0.  We cannot guarantee that the scripts will"
echo -e "will work on any other KinD release."
echo -e "*******************************************************************************************************************"
tput setaf 2
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.22.0/kind-linux-amd64
chmod +x ./kind

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Moving the KinD Binary to /usr/bin"
echo -e "*******************************************************************************************************************"
tput setaf 2
sudo mv ./kind /usr/bin

tput setaf 3
echo -e "\n*******************************************************************************************************************"
echo -e "KinD installation complete"
echo -e "*******************************************************************************************************************"
tput setaf 2

tput setaf 5
# Install kubectl to interact with the KinD Cluster
echo -e "\n \n*******************************************************************************************************************"
echo -e "Install kubectl"
echo -e "*******************************************************************************************************************"
tput setaf 3
# Sudo snap install kubectl --classic
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

tput setaf 5
# Install helmi and jq - We will use these in future chapters
echo -e "\n \n*******************************************************************************************************************"
echo -e "Installing Helm3 and jq"
echo -e "*******************************************************************************************************************"
tput setaf 3
# Get the official HELM downloader script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

sudo apt install snapd -y
sudo snap install jq  --classic

tput setaf 5
