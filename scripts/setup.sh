#!/bin/bash

echo "Deploying Terraform Infrastructure"

cd terraform

terraform init
terraform apply -auto-approve

echo "Connecting to EKS cluster"

aws eks update-kubeconfig \
--region us-east-1 \
--name sre-eks

echo "Deploying application"

kubectl apply -f ../kubernetes

echo "Installing monitoring stack"

helm repo add prometheus-community \
https://prometheus-community.github.io/helm-charts

helm install monitoring \
prometheus-community/kube-prometheus-stack \
-n monitoring \
--create-namespace

echo "Setup completed"