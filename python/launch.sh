#!/bin/bash

IMAGE_NAME="python-img"
CONTAINER_NAME="python-ctr"

source "$(dirname "$0")/../common/launch.sh" "$IMAGE_NAME" "$CONTAINER_NAME"
