#!/bin/bash
set -e

CONTAINER=$1
BACKUP_DIR=$2
RESTORE=$3

function backup_file {
    local FILENAME=$1

    if [ ! -z "$RESTORE" ]; then
        if [ -f "$BACKUP_DIR/$FILENAME" ]; then
            docker cp $BACKUP_DIR/$FILENAME $CONTAINER:/server/$FILENAME
        fi
    else
        docker cp $CONTAINER:/server/$FILENAME $BACKUP_DIR/$FILENAME
    fi
}

backup_file etesync-server.ini
backup_file db.sqlite3
backup_file secret.txt
