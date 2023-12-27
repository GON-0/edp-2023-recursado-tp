#!/bin/bash

PS3='>>Elija > '
echo ">>Hola, soy el menu del TP, que desea hacer?"
OPCIONES=$'1) Clasificar Archivos\n2) Monitorear Sistema \n3) Analizar Texto \n4) Salir'

select opcion in "Clasificar Archivos" "Monitorear Sistema" "Analizar Texto" "Salir"
do
 [[ -z $opcion ]] && echo ">>Elegir opcion valida!" && continue
 [ $REPLY == 1 ] && echo ">>Opcion elegida: " $opcion && ./clasificar.sh && echo "$OPCIONES" && continue
 [ $REPLY == 2 ] && echo ">>Opcion elegida: " $opcion &&  ./monitor.sh && echo "$OPCIONES" && continue
 [ $REPLY == 3 ] && echo ">>Opcion elegida: " $opcion && ./analizar.sh && echo "$OPCIONES" && continue
 [ $REPLY == 4 ] && echo ">>Eligio Salir" && break
done

