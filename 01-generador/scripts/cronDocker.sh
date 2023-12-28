#!/bin/bash

#---Forma de ejecutar
# > ./cron.sh
#---

#---Que hace?
#Programa una tarea cada 1 minuto para ejecutar el comando
#especificado en un directorio determinado.
#Usando el servicio cron
#---

#Esta opcion debe comentarse en caso de no ejecutarse dentro de un docker
systemctl start cron 

DIR=$(pwd)
COMANDO="./generador_random.sh"

echo "*/1 * * * * cd $DIR ; $COMANDO " > job
crontab job
rm job

#Para seguir dentro del docker luego de ejecutar lo anterior:
bash 