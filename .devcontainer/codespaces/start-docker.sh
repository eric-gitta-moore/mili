#!/bin/bash

echo "Waiting for Docker to start"

# Wait for Docker to start up
while [ ! -S /var/run/docker.sock ]; do
  echo -n "."
  cd /workspaces/mili/ && docker compose up -d
  sleep 3
done

echo "Docker is running!"