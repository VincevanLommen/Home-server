#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"
STACKS=(postgres mqtt node-red portainer glances minecraft pihole nas)
for dir in "${STACKS[@]}"; do
  if [ -f "$dir/docker-compose.yml" ]; then
    echo "Starting $dir..."
    docker compose -f "$dir/docker-compose.yml" up -d
  fi
done
echo "All stacks started."
