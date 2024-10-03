#!/bin/bash

############################################
#
# Nombre: ej03-gradosC2F.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: convertir grados Celsius a Fahrenheit
#
# Entrada: 1: celsius, 2: num decimales (opcional)
# Salida: mensaje
#
# Historial: 
#   2024-01-08: versión 1.0
#   2024-01-21: versión 2.0
#
############################################

# Argumentos
Celsius=$1

# Pide los comandos por teclado si no son introducidos
read -p "Indique los grados Celsius: " Celsius

# Calculos y mensaje
Fahrenheit=$(echo "$Celsius * 9/5 + 32" | bc )
echo "${Celsius}ºC son ${Fahrenheit}ºF"



## Argumentos
#Celsius=$1
#ndec=$2
#
## Mis variables y constantes
#ndecDEF=3
#
##echo "Has indicado $# argumentos"
##echo "Los argumentos que has indicado son: $*"
##echo "Los argumentos que has indicado son: $@"
##echo "Estoy en la línea $LINENO, llevo ejecutando $SECONDS y fui ejecutado por $USER"
#
#
#if [ $# -eq 0 ]
#then
#	echo "ERROR: No has indicado argumentos. Debes indicar 2 argumentos"
#	echo "SINTAXIS: $0 <grados Fahrenheit> <num decimales>"
#	exit 
#
#elif [ $# -eq 1 ]
#then
#	echo "Sólo has indicado 1 argumento (ºF)."
#	echo "Usaremos $ndecDEF decimales por defecto"
#	ndec=$ndecDEF
#
#elif [ $# -eq 2 ]
#then
#	echo "Perfecto!! Has indicado 2 argumentos"
#else
#	echo "Has indicado $# argumentos, sólo usaremos los dos primeros y se ignorará el resto"
#fi
#
#
#Fahrenheit=$(echo "scale=$ndec; $Celsius * 9/5 + 32" | bc )
#echo "${Celsius}ºC son ${Fahrenheit}ºF"