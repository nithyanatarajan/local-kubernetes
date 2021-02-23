#!/bin/sh
set -o errexit

# Create local registry if not present
running="$(docker inspect -f '{{.State.Running}}' "${REG_NAME}" 2>/dev/null || true)"
if [ "${running}" != 'true' ]; then
  docker volume create local_registry
  docker container run -d --name "${REG_NAME}" \
    -v local_registry:/var/lib/registry \
    --restart always -p "${REG_PORT}":5000 \
    registry:2
else
  echo "${REG_NAME}" already running
  curl -s localhost:"${REG_PORT}"/v2/_catalog | jq
fi
