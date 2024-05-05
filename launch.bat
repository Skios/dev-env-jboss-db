@echo off

REM Stop and remove containers managed by Docker Compose
REM This command will also remove any volumes associated with the containers.
docker-compose down -v

REM Remove the WildFly Docker image if needed
REM This command will not remove any running containers that are using the image.
docker rmi compose-wildfly-db-wildfly

REM Build the Docker image with the specified WILDFLY_MODE argument
REM This command will rebuild the image, even if it already exists.
docker build --no-cache -t compose-wildfly-db:latest .

REM Start the Docker containers with the specified project name (-p)
REM This command will start the containers in the background (-d).
docker-compose up -d