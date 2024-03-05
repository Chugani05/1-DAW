#!/bin/bash

############################################
#
# Nombre: sumatorio.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: hacer un pequeño script que se le pasen varios valores y me devuelva la suma de esos valores
#
# Historial:
#   2024-01-16: versión 1.0
#
############################################

sum=0
for num in "$@"
do
    #sum=$((sum+num))
    ((sum+=num))
done

num_val=$#
echo "La suma de todos los valores dados es $sum. La media es $((sum/num_val))