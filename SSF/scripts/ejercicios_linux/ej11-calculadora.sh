#!/bin/bash

#################################################
#
# Nombre: ej11-calculadora.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: implementar una calculadora simple
#
# Entradas: dos valores
# Salidas: operación elegida
#
# Historial:
#   2024-01-20: versión 1.0
#
#################################################

# Argumentos
a=$1
b=$2

# Verificar si se proporcionan 2 argumentos
if [ $# -ne 2 ]
then
	echo "ERROR, debe indicar DOS valores"
	echo "SINTAXIS: $0 <valor1> <valor2>"
	exit
fi

# Opciones de la calculadora
PS3="Elija una de las opciones: "
select opcion in "Sumar" "Restar" "Multiplicar" "Dividir" "Salir"
do
	case $opcion in
		"Sumar") echo "El resultado de $a + $b = $(( a+b ))" ;;
		"Restar") echo "El resultado de $a - $b = $(( a-b ))" ;;
		"Multiplicar") echo "El resultado de $a * $b = $(( a*b ))" ;;
		"Dividir") echo "El resultado de $a / $b = $(( a/b ))" ;;
		"Salir") break ;;
		*) echo "ERROR, '$REPLY' es una opción incorrecta"
	esac
done