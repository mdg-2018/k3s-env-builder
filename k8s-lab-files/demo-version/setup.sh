#!/bin/bash

echo "*********************************************************"
echo "Setting up demo environment - this may take 10-15 minutes"
echo ""
echo 'Observe the setup by running k9s and looking at the mongodb
namespace'
echo "*********************************************************"
echo ""
echo ""


MDBUSERNAME="admin"
MDBPASSWORD="mongodbpassword1"

# Install MongoDB Kubernetes Operator from Helm
helm repo add mongodb https://mongodb.github.io/helm-charts
helm install --kube-apiserver https://localhost:6443 --kube-insecure-skip-tls-verify kubernetes-operator mongodb/mongodb-kubernetes --namespace mongodb --create-namespace --set operator.watchNamespace="*"

find /home/ubuntu/k8s-lab-files/demo-version -type f -name "*.yaml" -exec kubectl apply -f {} \;


curl https://atlas-education.s3.amazonaws.com/sampledata.archive -o sampledata.archive

echo "Waiting 10 minutes for MongoDB to be ready before loading sample data"
sleep 600

kubectl port-forward pod/demo-0 27017:27017 -n mongodb &

sleep 5

for i in {1..20}; do
    mongorestore --nsExclude admin.* --username "$MDBUSERNAME" --password "$MDBPASSWORD" --archive=sampledata.archive && break
    echo "mongorestore failed, retrying in 60 seconds..."
    sleep 60
done