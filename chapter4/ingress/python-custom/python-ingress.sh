#!/bin/bash
clear

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Python deployment and service"
echo -e "*******************************************************************************************************************"

tput setaf 2
kubectl apply -f python-deploy.yaml

tput setaf 5
echo -e "\n \n*******************************************************************************************************************"
echo -e "Finding the IP address of the host to create the nip.io Ingress rule"
echo -e "*******************************************************************************************************************"
tput setaf 2
export hostip=$(hostname  -I | cut -f1 -d' ')
echo -e "\nFound the Host IP: $hostip"

tput setaf 3
echo -e "\n*******************************************************************************************************************"
echo -e "Creating the Ingress rule using $hostip"
echo -e "*******************************************************************************************************************\n"
tput setaf 2
sleep 2
envsubst < ingress-resource.yaml | kubectl create -f - --namespace default

tput setaf 7
echo -e "\n \n*******************************************************************************************************************"
echo -e "Ingress URL Rule: ingress.$hostip.nip.io \n"
echo -e "\n You can now browse to the NGINX pod using the nip.io domain from any machine on your local network"
echo -e "******************************************************************************************************************* \n\n"
tput setaf 2
