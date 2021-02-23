#!/bin/sh
set -o errexit

# create a cluster with the local registry enabled in containerd
cat <<EOF | kind create cluster --name "${CLUSTER_NAME}" --kubeconfig "$HOME/.kube/configs/${CLUSTER_NAME}.conf" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  # WARNING: It is _strongly_ recommended that you keep this the default
  # (127.0.0.1) for security reasons. However it is possible to change this.
  apiServerAddress: "127.0.0.1"
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:${REG_PORT}"]
    endpoint = ["http://${REG_NAME}:${REG_PORT}"]
EOF

if ${CONNECT_ON_CREATE}; then
  # connect the registry to the cluster network
  docker network connect kind "${REG_NAME}"
fi