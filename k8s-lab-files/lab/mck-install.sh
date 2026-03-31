#!/bin/bash

# Install MongoDB Kubernetes Operator from Helm
helm repo add mongodb https://mongodb.github.io/helm-charts
helm install --kube-apiserver https://localhost:6443 --kube-insecure-skip-tls-verify kubernetes-operator mongodb/mongodb-kubernetes --namespace mongodb --create-namespace --set operator.watchNamespace="*"
