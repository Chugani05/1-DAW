#!/bin/bash

############################################
#
# Nombre: resta.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Realizar la resta de dos números.
#
# Entrada: Dos números para restar.
# Salida: Resultado de la resta.
#
# Historial: 
#   2024-01-08: versión 1.0
#   2024-01-21: versión 2.0
#
############################################

# Almacenar los argumentos en variables
numero1=$1
numero2=$2

# Pide los comandos por teclado si no son introducidos
read -p "Indique el primer número: " numero1
read -p "Indique el segundo número: " numero2

# Realizar la resta
resultado=$((numero1 - numero2))

# Mostrar el resultado
echo "La resta de $numero1 y $numero2 es: $resultado"