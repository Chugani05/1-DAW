#!/bin/bash

############################################
#
# Nombre: par_case.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: indicar si un número es par o impar
#
# Entrada: elementos
# Salida: si es par o no
#
# Historial:
#   2024-01-12: versión 1.0
#
############################################

numero=$1

case $numero in

	"") echo "ERROR, debes indicar un argumento" ;;
	*0|*2|*4|*6|*8) echo "$numero es un número par" ;;
	*[13579]) echo "$numero es un número impar" ;;
	e) echo "Has indicado un número irracional" ;;
	*) echo "ERROR, parece que $numero" NO es un número ;;
esac