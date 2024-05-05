#Crea un backup nella cartella dalla quale viene lanciato il comando oppure è possibile sostituire ./backup.sql con il path dove si vuole depositare il backup
docker exec -t ${DB_CONTAINER_NAME} pg_dump -U ${DB_USER} -d ${DB_NAME} > ./backup.sql

#Restore del DB da fuori il container
docker cp /path/to/backup.sql container_name:/backup.sql
docker exec -t ${DB_CONTAINER_NAME} pg_restore -U ${DB_USER} -d ${DB_NAME} < ./backup.sql

docker exec -t compose-wildfly-db-postgres-1 pg_restore -U postgres -d gucci_devel < ./backup.sql

#Avvia il compose
docker-compose start
#Ferma il compose
docker-compose stop

docker-compose -f /path/to/project1/docker-compose.yml up -d
docker-compose -f /path/to/your/docker-compose.yml start
docker-compose -f /path/to/your/docker-compose.yml restart

#Attaccarsi ai logs in tail
docker logs -f compose-wildfly-db-wildfly-1

#Pulizia totale docker
#Remove Unused Containers
docker ps -a
docker container prune
#Remove Unused Images
docker images
docker image prune -a
#Remove Unused Volumes
docker volume ls
docker volume prune
#Remove Unused Networks
docker network ls
docker network prune
#Cleanup Totale
docker system prune -a
docker system df
#Remove Specific Resources (Containers, Images, Volumes, Networks) 
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -q)
docker volume rm -f $(docker volume ls -q)
docker network rm -f $(docker network ls -q)
#Remove Specific Resource change *_name with name or id
docker rm <container_name>
docker rmi <image_name>
docker volume rm <volume_name>
docker network rm <network_name>
#Monitor Disk Usage
docker system df