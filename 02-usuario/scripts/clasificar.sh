#!/bin/bash

#---Forma de ejecutar
# > ./clasificar.sh directorio 
#---

#---
#Clasifica los archivos almacenados en el directorio 
#pasado moviendolos a 3 carpetas distintas segun su tipo:
    #txt: archivos de textos
    #img: imagenes
    #snd: audios
#---

INPUTS_DIR=$1
OUTPUTS_DIR=./outputs


[[ ! -e $INPUTS_DIR ]] && echo "Error! directorio inexistente"

for FILE in $(ls $INPUTS_DIR)
do
    echo $FILE
    TIPO=$(file --mime-type -b $INPUTS_DIR/$FILE | cut -d '/' -f1)

    case $TIPO in
    text)
        mkdir -p $OUTPUTS_DIR/txt
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/txt/$FILE
        ;;
    image)
        mkdir -p $OUTPUTS_DIR/img
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/img/$FILE
        ;;
    audio)
        mkdir -p $OUTPUTS_DIR/snd   
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/snd/$FILE
        ;;
    esac
done