#!/bin/bash

#---Forma de ejecutar
# > ./cron.sh
#---

#---Que hace?
#Programa una tarea cada 1 minuto para ejecutar el comando
#especificado en un directorio determinado.
#Usando el servicio cron
#---

#systemctl start cron

DIR=$(pwd)
COMANDO="./generador_random.sh"

crontab -l > job
echo "*/1 * * * * cd $DIR ; $COMANDO " > job
crontab job
rm job
