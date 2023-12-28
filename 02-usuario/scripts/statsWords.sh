#!/bin/bash

FILE=$1
CONTENIDO=$(cat $FILE)

STR_MAX=""
MAX_LEN=0
STR_MIN=""
MIN_LEN=100
CONT=0
SUM=0

for STR in $CONTENIDO
do
    LEN=${#STR}
    [ $LEN -gt $MAX_LEN ] && MAX_LEN=$LEN && STR_MAX=$STR
    [ $LEN -lt $MIN_LEN ] && MIN_LEN=$LEN && STR_MIN=$STR
    SUM=$(($SUM + $LEN))
    ((CONT++))
done


echo -e "\n---------------------Estadisticas--------------------------"
echo "Palabra mas larga: $STR_MAX ($MAX_LEN caracteres)"
echo "Palabra mas corta: $STR_MIN ($MIN_LEN caracteres)"
echo "Promedio de longitud de palabras $(($SUM/$CONT))"
echo -e "-----------------------------------------------------------\n" 
