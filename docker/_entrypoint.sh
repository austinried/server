#!/bin/bash

chown etesyncer /server/etesync-server.ini
chown etesyncer /server/db.sqlite3
chown etesyncer /server/secret.txt

su -c "$@" etesyncer
