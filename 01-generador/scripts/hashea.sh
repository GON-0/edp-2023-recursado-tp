#!/bin/bash

#---Forma de ejecutar:
# > ./hashea.sh directorio archivo
#---

#---Que hace?
#Renombra el archivo pasado con su representacion hash correspondiente
#En el directorio pasado.
#---

FILE=$1

[[ $# != 1 || ! -e $FILE ]] && echo "Archivo inexistente" && exit 1

OUTPUTS_DIR=./outputs
HASH=$(md5sum $FILE |cut -d ' ' -f1)

mv $FILE $OUTPUTS_DIR/$HASH
