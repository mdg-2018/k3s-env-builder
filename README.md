These ansible scripts are intended to set up a quick "MongoDB in K8s" lab environment.

I had some problems with k3d so I built this to take care of the following:
- Spin up a vm and install k3s and some other tooling
- Modify my local kubeconfig to include the context for the new VM

Requirements:
- Must use linux with kvm
- You'll need to provide your own base image in the config file
- You'll need ansible installed along with the ansible libvirt package

Usage:
- First copy ```sample_config.json``` to ```config.json```
- Specify your base image and a password to allow ansible to become root on the remote vm
- Run ```k8slaunch.sh myNewVmName```

Warnings:
- This edits your ```~/.kube/config``` file and very well could mess it up. Use this tool with caution.