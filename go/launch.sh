#!/bin/bash

source "$(dirname "$0")/../export.sh"
echo $GIT_TOKEN
echo $TEST


if [ -z "$GIT_TOKEN" ]; then
  echo "Error: GIT_TOKEN is not set. Exiting."
  exit 1
fi

docker build -t go-img .

docker rm -f go-ctr 2>/dev/null || true && \

docker run -d \
  --name go-ctr \
  -v /home/mehdi/code:/app \
  -e GIT_TOKEN=$GIT_TOKEN \
  go-img
