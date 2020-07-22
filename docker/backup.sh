#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/settings.sh

RESTORE=$1

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

for FILE in ${BACKUP_FILES[*]}
do
    backup_file $FILE
done
