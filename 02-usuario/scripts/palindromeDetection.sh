#!/bin/bash

#Aclaracion:
#Muestro todas las palabras en minuscula para facilitar el codigo
#y evitar repeticiones de dos palabras iguales pero distinto tipo
#ejemplo: "y" e "Y" o "Reconocer" y "reconocer"

function es_palindromo {
    STR=$1
    REVERSO=$(echo $STR | rev 2> /dev/null) #Debo silenciar errores de rev porque aparecen solo en docker
    [[ $STR == $REVERSO ]]
    return $?
}

function esta_repetido {
    STR=$1
    grep -q $STR palindromes.txt
    return $?
}

FILE=$1
CONTENIDO=$(cat $FILE)
touch palindromes.txt
CONT=1

for STR in $CONTENIDO
do  
    STR=${STR,,}

    #Limpieza del string, saco "," o "." finales (lo habia hecho como funcion pero hay que hacer echo para devolver string, no queda bien)
    [[ $STR =~ \.$ ]] && STR=${STR//.} 
    [[ $STR =~ \,$ ]] && STR=${STR//,}
    #termina limpieza

    es_palindromo $STR
    PALINDROMO=$?
    if [ $PALINDROMO == 0 ]
    then
        esta_repetido $STR
        REPETIDO=$?
        [ $REPETIDO ==  1 ] && echo "$CONT) $STR" >> palindromes.txt && ((CONT++))
    fi
done

echo -e "\n--------------------- Palindromes --------------------------"
cat palindromes.txt
echo -e "-----------------------------------------------------------\n" 
rm palindromes.txt
