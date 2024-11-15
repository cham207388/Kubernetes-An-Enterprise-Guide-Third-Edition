#!/bin/bash
clear
# Assumes kind, kubectl, helm
tput setaf 5
echo -e "\n \n*******************************************************************************************************************"
echo -e "Create KinD Cluster using cluster01-kind.yaml configuration - Using the v.1.30.0 Image"
echo -e "*******************************************************************************************************************"
tput setaf 3

kind create cluster --name cluster01 --config cluster01-kind.yaml --image kindest/node:v1.30.6

# Add a label to the worker node, ingress-ready=true.  The NGINX deployment will only deploy to nodes that have this label.
tput setaf 5
echo -e "\n \n*******************************************************************************************************************"
echo -e "Adding node label for Ingress Controller to worker node"
echo -e "*******************************************************************************************************************"
tput setaf 3
kubectl label node cluster01-worker ingress-ready=true

echo -e "\n \n*******************************************************************************************************************"
echo -e "Install Calico from local file, using 10.240.0.0/16 as the pod CIDR"
echo -e "*******************************************************************************************************************"
tput setaf 3
kubectl create -f calico/tigera-operator.yaml
kubectl create -f calico/custom-resources.yaml

tput setaf 5
echo -e "\n \n*******************************************************************************************************************"
echo -e "Install NGINX Ingress Controller"
echo -e "*******************************************************************************************************************"
tput setaf 3
kubectl apply -f nginx-ingress/nginx-deploy.yaml

tput setaf 3
hostip=$(hostname  -I | cut -f1 -d' ')
echo -e "\n \n*******************************************************************************************************************"
echo -e "Cluster Creation Complete.  Please see the summary below for key information that will be used in later chapters"
echo -e "*******************************************************************************************************************"

tput setaf 7
echo -e "\n \n*******************************************************************************************************************"
echo -e "Your Kind Cluster Information: \n"
echo -e "Ingress Domain: $hostip.nip.io \n"
echo -e "Ingress rules will need to use the IP address of your Linux Host in the Domain name \n"
echo -e "Example:  You have a web server you want to expose using a host called ordering."
echo -e "          Your ingress rule would use the hostname: nginxweb.$hostip.nip.io"
echo -e "******************************************************************************************************************* \n\n"

tput setaf 2
