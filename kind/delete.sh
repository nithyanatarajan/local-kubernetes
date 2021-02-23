#!/bin/sh
set -o errexit

kind delete cluster --name "${CLUSTER_NAME}"

if ${DISCONNECT_ON_DELETE}; then
  # disconnect the registry from the cluster network
  docker network disconnect kind "${REG_NAME}"
fi
