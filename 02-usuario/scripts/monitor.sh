#!/bin/bash

OUTPUT_DIR=./outputs
mkdir -p $OUTPUT_DIR

DATE=$(date +"%d-%m-%Y-%T")
FILENAME="reporte_$DATE.txt"

MODELO_CPU=$(cat /proc/cpuinfo | grep 'model name' | uniq | cut -d ':' -f2)
CANT_NUCLEOS=$(cat /proc/cpuinfo | grep processor | wc -l)
FRECUENCIA=$(cat /proc/cpuinfo | grep 'MHz' | uniq | cut -d ':' -f2)
USO_CPU="$(top -n 2 -b | grep Cpu | tail -1 | cut -d ' ' -f3) %"


MEM_TOTAL="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f6) MiB"
USO_MEM="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f15) MiB"
MEM_LIBRE="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f10) MiB"


CANT_PROC=$(top -n 1 -b | grep 'Task' | cut -d ' ' -f3)
RUNNING=$(top -n 1 -b | grep 'Task' | cut -d ',' -f2)
SLEEPING=$(top -n 1 -b | grep 'Task' | cut -d ',' -f3)
STOPPED=$(top -n 1 -b | grep 'Task' | cut -d ',' -f4)
ZOMBIE=$(top -n 1 -b | grep 'Task' | cut -d ',' -f5)

USO_DISCO=$(df -t ext3 -t ext4 -h --total | grep total | awk '{print $3}')
USO_DISCO_P=$(df -t ext3 -t ext4 -h --total | grep total | awk '{print $5}')
LIBRE_DISCO=$(df -t ext3 -t ext4 -h --total | grep total | awk '{print $4}')
LIBRE_DISCO_P=$(df -t ext3 -t ext4 -h --total | grep total | awk ' { print 100-$5"%" }')
TOTAL_DISCO=$(df -t ext3 -t ext4 -h --total | grep total | awk '{print $2}')

echo "---------------------------------------------------------" > $OUTPUT_DIR/$FILENAME
echo "                     Usuario: $USER" >> $OUTPUT_DIR/$FILENAME

echo "---------------------------------------------------------" >> $OUTPUT_DIR/$FILENAME
#CPU
echo "CPU:" >> $OUTPUT_DIR/$FILENAME
echo "  -Modelo: $MODELO_CPU" >> $OUTPUT_DIR/$FILENAME
echo "  -Cantidad de nucleos: $CANT_NUCLEOS" >> $OUTPUT_DIR/$FILENAME
echo "  -Frecuencia: $FRECUENCIA" >> $OUTPUT_DIR/$FILENAME
echo "  -Uso de CPU: $USO_CPU"  >> $OUTPUT_DIR/$FILENAME

echo "---------------------------------------------------------" >> $OUTPUT_DIR/$FILENAME
#Memoria
echo "Memoria:" >> $OUTPUT_DIR/$FILENAME
echo "  -Total: $MEM_TOTAL" >> $OUTPUT_DIR/$FILENAME
echo "  -Uso: $USO_MEM" >> $OUTPUT_DIR/$FILENAME
echo "  -Libre: $MEM_LIBRE" >> $OUTPUT_DIR/$FILENAME

echo "---------------------------------------------------------" >> $OUTPUT_DIR/$FILENAME
#Procesos
echo "Procesos:" >> $OUTPUT_DIR/$FILENAME
echo "  -Cantidad: $CANT_PROC" >> $OUTPUT_DIR/$FILENAME
echo "  -$RUNNING" >> $OUTPUT_DIR/$FILENAME
echo "  -$SLEEPING" >> $OUTPUT_DIR/$FILENAME
echo "  -$STOPPED" >> $OUTPUT_DIR/$FILENAME
echo "  -$ZOMBIE" >> $OUTPUT_DIR/$FILENAME

echo "---------------------------------------------------------" >> $OUTPUT_DIR/$FILENAME
#Disco
echo "Disco:" >> $OUTPUT_DIR/$FILENAME
echo "  -Total: $TOTAL_DISCO" >> $OUTPUT_DIR/$FILENAME
echo "  -Uso: $USO_DISCO ($USO_DISCO_P)" >> $OUTPUT_DIR/$FILENAME
echo "  -Libre: $LIBRE_DISCO ($LIBRE_DISCO_P)" >> $OUTPUT_DIR/$FILENAME
echo "---------------------------------------------------------" >> $OUTPUT_DIR/$FILENAME
