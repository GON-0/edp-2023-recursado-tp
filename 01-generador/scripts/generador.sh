#!/bin/bash

#---Forma de ejecutar:
# > ./generador.sh tipo_archivo
#---

#---Que hace?
#Genera a pedido distintos tipos de archivos de tamaño aleatorio
#El tipo de archivo puede ser:
    #texto
    #imagen
    #audio
#---

TIPO_ARCHIVO=$1

[[ $# != 1 || $TIPO_ARCHIVO != "texto"  \
           && $TIPO_ARCHIVO != "imagen" \
           && $TIPO_ARCHIVO != "audio" ]] && echo "Error! entrada invalida" && exit 1


OUTPUTS_DIR=./outputs

function genera_texto {
    FILENAME=texto.txt
    TAM=$(($RANDOM % 3))

    [ $TAM = 0 ] && base64 /dev/urandom | head -c 500 > $OUTPUTS_DIR/$FILENAME
    [ $TAM = 1 ] && base64 /dev/urandom | head -c 1000 > $OUTPUTS_DIR/$FILENAME
    [ $TAM = 2 ] && base64 /dev/urandom | head -c 2000 > $OUTPUTS_DIR/$FILENAME

        ./hashea.sh $OUTPUTS_DIR/$FILENAME
}

function genera_imagen {
    FILENAME=imagen.png
    TAM=$(($RANDOM % 3))

    [ $TAM = 0 ] && convert -size 100x100 xc: +noise Random $OUTPUTS_DIR/$FILENAME
    [ $TAM = 1 ] && convert -size 250x250 xc: +noise Multiplicative $OUTPUTS_DIR/$FILENAME
    [ $TAM = 2 ] && convert -size 500x500 xc: +noise Poisson $OUTPUTS_DIR/$FILENAME

    ./hashea.sh $OUTPUTS_DIR/$FILENAME
}

function genera_audio {
    FILENAME=audio.wav
    TAM=$(($RANDOM % 3))

    [ $TAM = 0 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.5:c=white:duration=5" $OUTPUTS_DIR/$FILENAME
    [ $TAM = 1 ] && ffmpeg -f lavfi -i "anoisesrc=a=0.5:c=white:duration=10" $OUTPUTS_DIR/$FILENAME
    [ $TAM = 2 ] && ffmpeg -f lavfi -i "anoisesrc=a=1:c=white:duration=20" $OUTPUTS_DIR/$FILENAME
    
    ./hashea.sh $OUTPUTS_DIR/$FILENAME    
}


case $TIPO_ARCHIVO in
    texto)
        genera_texto 
        ;;
    imagen)
        genera_imagen
        ;;
    audio)
        genera_audio 
        ;;
esac