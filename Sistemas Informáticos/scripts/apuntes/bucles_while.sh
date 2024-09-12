#!/bin/bash

############################################
#
# Nombre: bucles_while.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: ejemplos simple de bucles en scripts
#
# Historial:
#   2024-01-16: versión 1.0
#
############################################

i=0
while [ "$i" -lt 10]
do
    echo "El valor de i es $i"
    #i=$((i+1))
    ((i++))
done

# Soporta:
# while [[ ]]
# while ((i < 10))

i=0
until [ "$i" -lt 10]
do
    echo "El valor de i es $i"
    #i=$((i+1))
    ((i++))
done


# Ejemplo de uso del break y continue (EVITARLO SIEMPRE QUE SEA POSIBLE!!)
while true
do
    read -p "Dime un valor mayor entre 10 y 20" val
    if [ "$val" -ge 10 ] && [ "$val" -le 20 ]
    then
            echo "Correcto"
            break
    else
            echo "Noooo!!!"
            continue
    fi
    echo "Este mensaje Nunca se imprimira"
done