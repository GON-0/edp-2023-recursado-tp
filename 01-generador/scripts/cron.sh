#!/bin/bash

#---Forma de ejecutar
# > ./cron.sh
#---

#---Que hace?
#Programa una tarea cada 1 minuto para ejecutar el comando
#especificado en un directorio determinado.
#Usando el servicio cron
#---


DIR=$(pwd)
COMANDO="./generador_random.sh"

#Para que se agregue a la lista de las tareas programadas
crontab -l > job
echo "*/1 * * * * cd $DIR ; $COMANDO " >> job
crontab job
rm job
