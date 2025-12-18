#!/bin/bash

source "$(dirname "$0")/../export.sh"

if [ -z "$GIT_TOKEN" ]; then
  echo "Error: GIT_TOKEN is not set. Exiting."
  exit 1
fi


docker build -t python-img .

docker rm -f python-ctr 2>/dev/null || true && \

docker run -d \
  --name python-ctr \
  -v /home/mehdi/code:/app \
  -e GIT_TOKEN=$GIT_TOKEN \
  python-img
