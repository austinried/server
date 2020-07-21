#!/bin/bash
set -e

cd /server
source venv/bin/activate

./manage.py migrate
exec ./manage.py runserver 0.0.0.0:8000
