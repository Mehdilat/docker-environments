#!/bin/bash

# Parse command line arguments
if [ -z "$1" ]; then
  echo "Error: Image name is required."
  exit 1
fi
IMAGE_NAME="$1"

if [ -z "$2" ]; then
  echo "Error: Container name is required."
  exit 1
fi
CONTAINER_NAME="$2"

# Export environment variaables
EXPORT_SCRIPT_DIR="$(dirname "$0")/../common/export.sh"
if [ ! -f "$EXPORT_SCRIPT_DIR" ]; then
  echo "Error: Export script not found ($EXPORT_SCRIPT_DIR)."
  exit 1
fi
source $EXPORT_SCRIPT_DIR

REQUIRED_VARS=("GIT_TOKEN" "GIT_NAME" "GIT_EMAIL" "AWS_ACCESS_KEY_ID" "AWS_SECRET_ACCESS_KEY" "AWS_DEFAULT_REGION")

for var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo "Error: $var is not set. Exiting."
    exit 1
  fi
done

ENV_FLAGS=""
for var in "${REQUIRED_VARS[@]}"; do
  ENV_FLAGS="$ENV_FLAGS -e $var=${!var}"
done

# Build Docker image
docker build \
  --build-arg GIT_NAME="$GIT_NAME" \
  --build-arg GIT_NAME="$GIT_EMAIL" \
  --build-arg GIT_NAME="$GIT_TOKEN" \
  -t "$IMAGE_NAME" "$(dirname "$0")"

# Run Docker image
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true && \
docker run -d \
  --name "$CONTAINER_NAME" \
  -v /home/mehdi/code:/app \
  $ENV_FLAGS \
  "$IMAGE_NAME"
