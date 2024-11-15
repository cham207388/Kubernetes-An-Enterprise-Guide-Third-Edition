#!/bin/bash

# Deleting kind clusters
echo "Deleting kind clusters..."

for cluster in $(kind get clusters); do
  kind delete cluster --name "$cluster"
  echo "${cluster} is deleted!"
done
