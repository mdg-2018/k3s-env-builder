#!/bin/bash
VMIP=$1
VM_NAME=$2

# Get remote kubeconfig
scp matt@$VMIP:/home/matt/k3s-kubeconfig.yaml /home/matt/.kube/script-tmpconfig

# Backup current kubeconfig
cp /home/matt/.kube/config /home/matt/.kube/config.script.bak

# Edit script-tmpconfig to change username and cluster name
cat /home/matt/.kube/script-tmpconfig | sed "s/user: default/user: $VM_NAME/g" | sed "s/name: default/name: $VM_NAME/g" | sed "s/cluster: default/cluster: $VM_NAME/g" | sed "s/server: https:\/\/127.0.0.1:6443/server: https:\/\/$VMIP:6443/g" > /home/matt/.kube/script-tmpconfig2


# Merge script-tmpconfig with existing kubeconfig
KUBECONFIG=/home/matt/.kube/config.script.bak:/home/matt/.kube/script-tmpconfig2 kubectl config view --flatten | cat - > /home/matt/.kube/config

# Cleanup temporary files
rm /home/matt/.kube/script-tmpconfig
rm /home/matt/.kube/script-tmpconfig2