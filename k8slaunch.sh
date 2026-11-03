#!/bin/bash
VM_NAME=$1
JOIN_NODE=$2
K3S_TOKEN=$3

INSTALL_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
echo $INSTALL_DIR
cd $INSTALL_DIR

ansible-playbook create-vm.yaml --ask-become-pass --extra-vars="vm_name=k3s-$VM_NAME join_node=$JOIN_NODE k3s_token=$K3S_TOKEN"