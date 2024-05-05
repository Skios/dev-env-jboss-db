#!/bin/bash

# Stop and remove containers managed by Docker Compose
docker-compose down -v
# Remove the WildFly Docker image if needed
docker rmi compose-wildfly-db-wildfly
# Build the Docker image with the specified WILDFLY_MODE argument
docker build --no-cache -t compose-wildfly-db:latest .
# Start the Docker containers with the specified project name (-p)
docker-compose up -d