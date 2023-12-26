#!/bin/bash

OUTPUT_DIR=./outputs
mkdir -p $OUTPUT_DIR

DATE=$(date +"%d-%m-%Y-%T")
FILENAME="reporte_$DATE.txt"

USO_CPU="$(top -n 1 -b | grep Cpu | cut -d ' ' -f3) %"
USO_MEM="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f15) MiB"
MEM_TOTAL="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f6) MiB"
MEM_LIBRE="$(top -n 1 -b | grep 'MiB Mem' | cut -d ' ' -f10) MiB"
CANT_PROC=$(top -n 1 -b | grep 'Task' | cut -d ' ' -f3)
RUNNING=$(top -n 1 -b | grep 'Task' | cut -d ',' -f2)
SLEEPING=$(top -n 1 -b | grep 'Task' | cut -d ',' -f3)
STOPPED=$(top -n 1 -b | grep 'Task' | cut -d ',' -f4)
ZOMBIE=$(top -n 1 -b | grep 'Task' | cut -d ',' -f5)


echo "Usuario: $USER" > $OUTPUT_DIR/$FILENAME
echo "Uso de CPU: $USO_CPU"  >> $OUTPUT_DIR/$FILENAME
echo "Memoria:" >> $OUTPUT_DIR/$FILENAME
echo "  -Uso: $USO_MEM" >> $OUTPUT_DIR/$FILENAME
echo "  -Total: $MEM_TOTAL" >> $OUTPUT_DIR/$FILENAME
echo "  -Libre: $MEM_LIBRE" >> $OUTPUT_DIR/$FILENAME
echo "Procesos" >> $OUTPUT_DIR/$FILENAME
echo "  -Cantidad: $CANT_PROC" >> $OUTPUT_DIR/$FILENAME
echo "  -$RUNNING" >> $OUTPUT_DIR/$FILENAME
echo "  -$SLEEPING" >> $OUTPUT_DIR/$FILENAME
echo "  -$STOPPED" >> $OUTPUT_DIR/$FILENAME
echo "  -$ZOMBIE" >> $OUTPUT_DIR/$FILENAME


