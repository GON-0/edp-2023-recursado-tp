#!/bin/bash

function es_email {
    STR=$1
    REGEX="^[A-Za-z0-9áéíóú._-]+@[A-Za-z0-9._-]+\.[a-z]{2,}$"
    [[ $STR =~ $REGEX ]]
    return $?
}

function esta_repetido {
    STR=$1
    grep -q $STR lista_emails.txt
    return $?
}


FILE=$1
CONTENIDO=$(cat $FILE)
touch lista_emails.txt
CONT=1

for STR in $CONTENIDO
do
    #Limpieza del string, saco "," o "." finales (lo habia hecho como funcion pero hay que hacer echo para devolver string, no queda bien)
    [[ $STR =~ \.$ ]] && STR=${STR//.}
    [[ $STR =~ \,$ ]] && STR=${STR//,}
    #termina limpieza

    es_email $STR
    RES=$?
    if [ $RES == 0 ]
    then
        esta_repetido $STR
        REPETIDO=$?
        [ $REPETIDO == 1 ] && echo "$CONT) $STR" >> lista_emails.txt && ((CONT++))
    fi
done

echo -e "\n------------------------ Emails ---------------------------"
cat lista_emails.txt
echo -e "-----------------------------------------------------------\n" 
rm lista_emails.txt

