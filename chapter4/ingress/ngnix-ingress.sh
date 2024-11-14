#!/bin/bash
clear
# nginx-ingress-controller is already deployed to the cluster when in chapter 1
# Create a simple NGINX deployment using kubectl and name it nginx-web
tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Deploying the NGINX pod and Exposing them via service"
echo -e "*******************************************************************************************************************"
tput setaf 2
kubectl apply -f ./manifests/nginx-web.yaml

# Find IP address of Docker Host
# We need to know the IP of the Host since we use nip.io for name resolution.  Nip.ip names follow the standard <url>.<host ip>.nip.io
# For example, if you wanted to have two Ingress rules, one for a sales web site and one for an ordering website, and your Host IP is 192.168.1.1
# your nip.io names would be sales.192.168.1.1.nip.io and ordering.192.168.1.1.nip.io
# This does assume that the first IP found is the correct IP address of the Host.  In a multi-homed system you may need to use a different
# IP address, but we have no easy way to know the correct IP to use if there are multiple IP addresses on a Host system.
tput setaf 5
echo -e "\n \n*******************************************************************************************************************"
echo -e "Finding the IP address of the host to create the nip.io Ingress rule"
echo -e "*******************************************************************************************************************"
tput setaf 2
export hostip=$(hostname  -I | cut -f1 -d' ')
echo -e "\nFound the Host IP: $hostip"

# Use the IP address tht was found in the last step to create a new Ingress rule using nip.io
# We use the IP that we found and envsubst a template called ingress.yaml that will change the value in the Ingress rule
# to use the IP address of the host.
tput setaf 3
echo -e "\n*******************************************************************************************************************"
echo -e "Creating the Ingress rule using $hostip"
echo -e "*******************************************************************************************************************\n"
tput setaf 2
sleep 2
envsubst < ingress.yaml | kubectl create -f - --namespace default

# Use the IP found in the previous step:
# Summarize the KinD deployment and show the user an example of a nip.io address that can be used for Ingress rules.
tput setaf 7
echo -e "\n \n*******************************************************************************************************************"
echo -e "Ingress URL Rule: webserver.$hostip.nip.io \n"
echo -e "\n You can now browse to the NGINX pod using the nip.io domain from any machine on your local network"
echo -e "******************************************************************************************************************* \n\n"
tput setaf 2

