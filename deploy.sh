#!/bin/bash

set -e

echo "Starting docker compose..."
docker compose up -d

echo "Waiting for containers start..."
sleep 10

echo "Containers running:"
docker compose ps

echo "Starting ansible-playbook..."
ansible-playbook ansible/playbook.yml --become-password-file ansible/become_password
