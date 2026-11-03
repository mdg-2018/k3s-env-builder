#!/bin/bash
if [ -n "$JOIN_NODE" ]; then
  curl -sfL https://get.k3s.io | K3S_URL="https://$JOIN_NODE:6443" K3S_TOKEN="$K3S_TOKEN" sh -
else
  curl -sfL https://get.k3s.io | sh -
fi