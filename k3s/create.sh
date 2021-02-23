#!/bin/sh
set -o errexit

k3d cluster create "${CLUSTER_NAME}" \
  --kubeconfig-switch-context=false \
  --kubeconfig-update-default=false \
  --registry-config=./registries.yaml

# connect the registry to the cluster network
docker network connect k3d-"${CLUSTER_NAME}" "${REG_NAME}"