#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=etesync-server
CONTAINER=etesync_server

cp_container() {
    local LOCAL_FILE=$1
    local CONTAINER_FILE=$2

    if [ ! -f "$LOCAL_FILE" ]; then

        if [ -z "$INIT_CONTAINER" ]; then
            INIT_CONTAINER=$(docker create $IMAGE)
        fi

        docker cp $INIT_CONTAINER:$CONTAINER_FILE $LOCAL_FILE
    fi
}

cp_container $DIR/config/etesync-server.ini /server/etesync-server.ini
cp_container $DIR/data/db.sqlite3 /server/db.sqlite3
cp_container $DIR/data/secret.txt /server/secret.txt

if [ ! -z "$INIT_CONTAINER" ]; then
    docker rm $INIT_CONTAINER
fi

if [ "$(docker ps -a | grep $CONTAINER)" ]; then
    docker start $CONTAINER
else
    docker run \
        --detach \
        -p 127.0.0.1:8000:8000 \
        --mount type=bind,src=$DIR/config/etesync-server.ini,dst=/server/etesync-server.ini \
        --mount type=bind,src=$DIR/data/db.sqlite3,dst=/server/db.sqlite3 \
        --mount type=bind,src=$DIR/data/secret.txt,dst=/server/secret.txt \
        --name $CONTAINER \
        $IMAGE
fi
