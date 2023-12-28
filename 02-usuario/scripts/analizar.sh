#!/bin/bash

echo ">>Ingrese la ruta del texto a analizar:"
read FILE

[[ ! -e $FILE || ! -s $FILE ]] && echo "Error! Archivo inextistente o vacio" && exit 1

CANT_STR=$(wc -w $FILE | cut -d ' ' -f1)

[ $CANT_STR == 0 ] && echo "Error! Archivo sin palabras que analizar" && exit 2

PS3='>>Elija > '
echo ">>Hola, soy el analizador de textos, que desea hacer?"
OPCIONES=$'1) Estadisticas \n2) Palindromos \n3) Detectar mails \n4) Salir'

select opcion in "Estadisticas" "Palindromos" "Detectar mails" "Salir"
do
    [[ -z $opcion ]] && echo ">>Elegir opcion valida!" && continue
    [ $REPLY == 1 ] && echo ">>Opcion elegida: " $opcion && ./statsWords.sh $FILE && echo "$OPCIONES" && continue
    [ $REPLY == 2 ] && echo ">>Opcion elegida: " $opcion &&  ./palindromeDetection.sh $FILE && echo "$OPCIONES" && continue
    [ $REPLY == 3 ] && echo ">>Opcion elegida: " $opcion && ./mailAddressDetection.sh $FILE && echo "$OPCIONES" && continue
    [ $REPLY == 4 ] && echo ">>Eligio Salir" && break
done
