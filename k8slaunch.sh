#!/bin/bash
VM_NAME=$1

INSTALL_DIR=/home/matt/projects/k3s-env-builder
cd $INSTALL_DIR

ansible-playbook create-vm.yaml --ask-become-pass --extra-vars="vm_name=k3s-$VM_NAME"