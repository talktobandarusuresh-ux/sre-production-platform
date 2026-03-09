#!/bin/bash

echo "Deleting Kubernetes resources..."

kubectl delete -f kubernetes/ --ignore-not-found

kubectl delete namespace monitoring --ignore-not-found

kubectl delete namespace argocd --ignore-not-found

kubectl delete namespace logging --ignore-not-found

echo "Destroying AWS infrastructure..."

cd terraform

terraform destroy -auto-approve

echo "All resources removed successfully."