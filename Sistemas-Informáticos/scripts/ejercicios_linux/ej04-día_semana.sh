#!/bin/bash

############################################
#
# Nombre: ej04-día_semana.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: determinar el día de la semana para una fecha dada
#
# Entrada: 1: día, 2: mes, 3: año
# Salida: mensaje
#
# Historial: 
#   2024-01-08: versión 1.0
#   2024-01-21: versión 2.0
#
############################################

# argumentos
dia=$1
mes=$2
ano=$3

# obliga a poner los argumentos y si no se hace da error
if [ $# -eq 0 ]
then
	echo "ERROR: No has indicado argumentos. Debes indicar 3 argumentos"
	echo "SINTAXIS: $0 <día> <mes> <año>"
	exit 

elif [ $# -eq 1 ]
then
	echo "Perfecto!! Has indicado 3 argumentos"
else
	echo "Has indicado $# argumentos, sólo usaremos los tres primeros y se ignorará el resto"
fi

# calculo del dia de la semana
fecha="$ano-$mes-$dia"
nombre_dia=$(date -d "$fecha" "+%A")

# mensaje
echo "El día de la semana de la fecha indicada ($dia/$mes/$ano) fue: $nombre_dia"