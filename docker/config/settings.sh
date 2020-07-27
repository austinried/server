#!/bin/bash

CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IMAGE=etesync-server
CONTAINER=etesync_server
BACKUP_DIR=$CONFIG_DIR/../data
BACKUP_FILES=(
    etesync-server.ini
    secret.txt
)
BACKUP_DB=db.sqlite3
