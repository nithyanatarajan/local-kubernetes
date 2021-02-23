#!/bin/sh
set -o errexit

docker network disconnect k3d-"${CLUSTER_NAME}" "${REG_NAME}"
k3d cluster delete "${CLUSTER_NAME}"

