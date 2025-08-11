#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="${MONGO_CONTAINER_NAME:-local-mongodb}"
TS="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="dump/${TS}"

mkdir -p "${OUT_DIR}"

docker exec "${CONTAINER_NAME}" bash -lc 'rm -rf /tmp/dump && mkdir -p /tmp/dump'

docker exec "${CONTAINER_NAME}" mongodump \
  -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" \
  --authenticationDatabase admin \
  --gzip \
  --out /tmp/dump

docker cp "${CONTAINER_NAME}":/tmp/dump "${OUT_DIR}"

echo "Backup done -> ${OUT_DIR}/dump"