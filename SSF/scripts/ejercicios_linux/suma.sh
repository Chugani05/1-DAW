#!/bin/bash

############################################
#
# Nombre: suma.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: realizar la suma de dos numeros
#
# Entrada: 1, 2 y 3
# Salida: suma
#
# Historial:
#   2023-12-18: versión 1.0
#
############################################

resultado=$(($1+$2))

echo "$1+$2=$resultado"