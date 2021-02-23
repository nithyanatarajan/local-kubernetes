#!/bin/sh
set -o errexit

running="$(docker inspect -f '{{.State.Running}}' "${REG_NAME}" 2>/dev/null || true)"
if [ "${running}" == 'true' ]; then
  docker container stop "${REG_NAME}"
  echo "${REG_NAME}" stopped
  docker container rm "${REG_NAME}" -v
  echo "${REG_NAME}" removed
else
  echo "${REG_NAME}" already stopped
fi
