#!/bin/bash
clear

pythonu1=python-u01
pythonu2=python-u02
pythoningress=python-ingress

# Delete the simple NGINX deployment: nginx-web using kubectl a
tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Cleaning up the NGINX resources"
echo -e "*******************************************************************************************************************"
tput setaf 2
kubectl delete deploy $pythonu1
kubectl delete deploy $pythonu2
kubectl delete svc $pythonu1
kubectl delete svc $pythonu2
kubectl delete ingress python-ingress

tput setaf 7
echo -e "\n \n*******************************************************************************************************************"
echo -e "Done.  The $pythoningress ingress has been removed from the cluster."
echo -e "******************************************************************************************************************* \n\n"
tput setaf 2

