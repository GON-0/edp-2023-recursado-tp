#!/bin/bash

#---Forma de ejecutar
# > generador_random.sh
#---


TIPO=$(($RANDOM % 3))

echo $TIPO

[ $TIPO == 0 ] && ./generador.sh texto
[ $TIPO == 1 ] && ./generador.sh imagen
[ $TIPO == 2 ] && ./generador.sh audio