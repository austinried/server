#!/bin/bash
set -e

USER=admin
PASSWORD=$(openssl rand -base64 32)

cd /server
source venv/bin/activate

./manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$USER', '$USER@127.0.0.1', '$PASSWORD')" | python ./manage.py shell

echo ""
echo "======================================================"
echo "Admin user generated!"
echo ""
echo "Username: $USER"
echo "Password: $PASSWORD"
echo ""
echo "If you are using an existing database, ignore this."
echo "======================================================"
echo ""
