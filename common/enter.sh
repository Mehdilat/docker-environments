#!/bin/bash

# Parse command line arguments
if [ -z "$1" ]; then
  echo "Error: Container name is required."
  exit 1
fi
CONTAINER_NAME="${1}"

# Enter container
docker exec -it "$CONTAINER_NAME" /bin/bash
