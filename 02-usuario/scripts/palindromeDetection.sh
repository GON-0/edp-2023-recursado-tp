#!/bin/bash

#Aclaracion:
#Muestro todas las palabras en minuscula para facilitar el codigo
#y evitar repeticiones de dos palabras iguales pero distinto tipo
#ejemplo: "y" e "Y" o "Reconocer" y "reconocer"

function es_palindromo {
    REVERSO=$(echo $PALABRA | rev)
    [[ $PALABRA == $REVERSO ]]
    return $?
}

function esta_repetido {
    grep -q $PALABRA palindromes.txt
    return $?
}

FILE=$1
CONTENIDO=$(cat $FILE)
touch palindromes.txt
CONT=1

for STR in $CONTENIDO
do  
    PALABRA=${STR,,}
    es_palindromo $PALABRA
    PALINDROMO=$?
    if [ $PALINDROMO == 0 ]
    then
        esta_repetido $PALABRA
        REPETIDO=$?
        [ $REPETIDO ==  1 ] && echo "$CONT) $PALABRA" >> palindromes.txt && ((CONT++))
    fi
done

echo -e "\n--------------------- Palindromes --------------------------"
cat palindromes.txt
echo -e "-----------------------------------------------------------\n" 
rm palindromes.txt
