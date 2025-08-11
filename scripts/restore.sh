#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="${MONGO_CONTAINER_NAME:-local-mongodb}"

SRC="${1:-}"
if [[ -z "${SRC}" ]]; then
  echo "Usage: $0 dump/<timestamp>/dump"
  exit 1
fi

[ -d "${SRC}" ] || { echo "Path not found: ${SRC}"; exit 1; }

docker cp "${SRC}" "${CONTAINER_NAME}":/tmp/dump

docker exec "${CONTAINER_NAME}" mongorestore \
  -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --gzip \
  --drop \
  /tmp/dump

echo "Restore done"