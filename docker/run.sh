#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/settings.sh

function on_exit {
    mkdir -p $DIR/data
    $DIR/backup.sh
}

if [ ! "$(docker ps -a | grep $CONTAINER)" ]; then
    docker create \
        --tty \
        --interactive \
        -p 127.0.0.1:8000:8000 \
        --name $CONTAINER \
        $IMAGE
fi

$DIR/backup.sh --restore

trap on_exit EXIT

docker start \
    --attach \
    --interactive \
    $CONTAINER
