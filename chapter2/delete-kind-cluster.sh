#!/bin/bash

for cluster in $(kind get clusters); do
  kind delete cluster --name "$cluster"
  echo "${cluster} is deleted!"
done
