#!/bin/bash

set -a
[ -f docker/.env ] && . docker/.env
set +a

# Stop and remove all Docker containers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Remove all Docker images
docker rmi -f $(docker images -q)

# Remove all Docker volumes
docker volume rm $(docker volume ls -q)

# Build the Docker image
docker build -t general-api-image --rm .

# Run the Docker container
docker run --name general-api -d -p 80:80 -p 443:443 general-api-image
