#!/bin/bash

#################################################
#
# Nombre: ej07-compara.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: comparar dos números
#
# Entrada: 2 argumentos (números a comparar)
# Salidas: indica qué número es mayor, o si son iguales
#
# Historial:
#   2024-01-20: versión 1
#
#################################################

a=$1
b=$2

# Compruebo que me han pasado los argumentos, y si no, los 
# pido por teclado
if [ "$a" = "" ]
then
	read -p "Por favor, introduzca el primer valor: " a
fi

if [ -z "$b" ]
then
	read -p "Por favor, introduzca el segundo valor: " b
fi

# Compruebo qué número es mayor
if [ "$a" -gt "$b" ]
then
	echo "$a es mayor que $b"
elif [ "$a" -lt "$b" ]
then
	echo "$b es mayor que $a"
else
	echo "Los dos números son iguales"
fi