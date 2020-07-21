#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR=$DIR/..

docker build -f $DIR/Dockerfile -t etesync-server $PROJECT_DIR
