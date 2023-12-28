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

INPUTS_DIR=./inputs
OUTPUTS_DIR=./outputs
mkdir -p $OUTPUT_DIR
CANT_TXT=0
CANT_IMG=0
CANT_SND=0

[[ ! -e $INPUTS_DIR ]] && echo "Error! directorio inexistente"

for FILE in $(ls $INPUTS_DIR)
do
    TIPO=$(file --mime-type -b $INPUTS_DIR/$FILE | cut -d '/' -f1)

    case $TIPO in
    text)
        CANT_TXT=$(($CANT_TXT + 1))
        mkdir -p $OUTPUTS_DIR/txt
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/txt/texto$CANT_TXT.txt
        ;;
    image)
        CANT_IMG=$(($CANT_IMG + 1))
        mkdir -p $OUTPUTS_DIR/img
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/img/imagen$CANT_IMG.png
        ;;
    audio)
        CANT_SND=$(($CANT_SND + 1))
        mkdir -p $OUTPUTS_DIR/snd   
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/snd/audio$CANT_SND.wav
        ;;
    *)
        mkdir -p $OUTPUTS_DIR/varios   
        mv $INPUTS_DIR/$FILE $OUTPUTS_DIR/varios/$FILE
        ;;
    esac
done

tar zcvf $OUTPUTS_DIR/outputs.tar.gz $OUTPUTS_DIR