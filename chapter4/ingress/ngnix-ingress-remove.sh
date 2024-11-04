#!/bin/bash
clear

# Delete the simple NGINX deployment: nginx-web using kubectl a
tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Cleaning up the NGINX resources"
echo -e "*******************************************************************************************************************"
tput setaf 2
kubectl delete deployment nginx-web
kubectl delete svc nginx-web
kubectl delete ingress nginx-ingress

tput setaf 7
echo -e "\n \n*******************************************************************************************************************"
echo -e "Done.  The ingress example has been removed from the cluster."
echo -e "******************************************************************************************************************* \n\n"
tput setaf 2

