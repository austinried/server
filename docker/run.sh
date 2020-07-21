#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=etesync-server
CONTAINER=etesync_server

function on_exit {
    mkdir -p $DIR/data
    $DIR/backup.sh $CONTAINER $DIR/data
}

if [ ! "$(docker ps -a | grep $CONTAINER)" ]; then
    docker create \
        --tty \
        --interactive \
        -p 127.0.0.1:8000:8000 \
        --name $CONTAINER \
        $IMAGE
fi

$DIR/backup.sh $CONTAINER $DIR/data --restore

trap on_exit EXIT

docker start \
    --attach \
    --interactive \
    $CONTAINER
