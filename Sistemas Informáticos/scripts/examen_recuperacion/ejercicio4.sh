#!/bin/bash

######################################################
# Nombre: ejercicio4.sh
# Autor: Rashi Chugani
#
# Objetivo: Programar una tarea a las 20:00 dentro de 5 dás
#
# Variables:
#   Entrada: comando
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
comando=$1

if [ $# -eq 0 ]
then
	echo "ERROR: No has indicado argumentos. Debes indicar 1 argumentos"
	exit 10

elif [ $# -eq 1 ]
then
	echo "Perfecto!! Has indicado 1 argumentos"
else
	echo "Has indicado $# argumentos, sólo usara el primero y se ignorará el resto"
fi

crontab "$comando"