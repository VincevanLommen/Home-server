#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"
STACKS=(nas pihole minecraft glances portainer node-red mqtt postgres)
for dir in "${STACKS[@]}"; do
  if [ -f "$dir/docker-compose.yml" ]; then
    echo "Stopping $dir..."
    docker compose -f "$dir/docker-compose.yml" down
  fi
done
echo "All stacks stopped."
