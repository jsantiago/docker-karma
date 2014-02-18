#!/bin/bash

REPO="docker-karma"

HOST_MOUNT="$PWD"
CONTAINER_MOUNT="/opt/karma"

HOST_PORT="9876"
CONTAINER_PORT="9876"

MOUNT=""
PORT=""
while [[ -n "$1" ]]; do
    case $1 in
        -v ) shift
            MOUNT="-v $1"
            ;;
        -p ) shift
            PORT="-p $1"
            ;;
    esac
    shift
done

if [[ -z "$MOUNT" && -n "$HOST_MOUNT" && -n "$CONTAINER_MOUNT" ]]; then
    MOUNT="-v $HOST_MOUNT:$CONTAINER_MOUNT"
fi

if [[ -z "$PORT" && -n "$HOST_PORT" && -n "$CONTAINER_PORT" ]]; then
    PORT="-p $HOST_PORT:$CONTAINER_PORT"
fi

# Build
docker build -rm -t $REPO .

# Run
docker run $PORT $MOUNT -i -t $REPO

# Remove stopped containers
CONTAINERS=$(docker ps  -a | grep 'Exit' | awk '{print $1}')
if [[ -n $CONTAINERS ]]; then
    docker rm $CONTAINERS
fi

# Remove untagged images
IMAGES=$(docker images | grep "^<none>" | awk '{print $3}')
if [[ -n $IMAGES ]]; then
    docker rmi $IMAGES
fi
