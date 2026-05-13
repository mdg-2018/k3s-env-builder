#!/bin/bash

# Configure longhorn storage provider
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.8.1/deploy/longhorn.yaml


# Configure longhorn snapshots to work with CSI snapshots
#CSI snapshot controllers are not a default part of the kubernetes api. Install like this:
git clone https://github.com/kubernetes-csi/external-snapshotter.git

# Then install the snapshot controller and crds
kubectl create -k external-snapshotter/client/config/crd
kubectl create -k external-snapshotter/deploy/kubernetes/snapshot-controller

# Create longhorn VolumeSnapshotClass
kubectl apply -f ./VolumeSnapshotClass.yaml