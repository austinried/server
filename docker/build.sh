#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/settings.sh

docker build -f $DIR/Dockerfile -t $IMAGE $DIR/../
