#!/bin/bash

source /server/docker/config/settings.sh

for FILE in ${BACKUP_FILES[*]}
do
    chown etesyncer /server/$FILE
done
chown etesyncer /server/$BACKUP_DB

exec su -c "$@" etesyncer
