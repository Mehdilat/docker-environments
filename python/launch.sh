#!/bin/bash

source "$(dirname "$0")/../export.sh"

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


docker build -t python-img "$(dirname "$0")"

docker rm -f python-ctr 2>/dev/null || true && \

docker run -d \
  --name python-ctr \
  -v /home/mehdi/code:/app \
  $ENV_FLAGS \
  python-img
