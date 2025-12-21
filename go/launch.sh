#!/bin/bash

IMAGE_NAME="go-img"
CONTAINER_NAME="go-ctr"

source "$(dirname "$0")/../common/launch.sh" "$IMAGE_NAME" "$CONTAINER_NAME"
