#!/bin/bash

#########################################
#
# Nombre: arrays.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: ejemplos simples de arrays
#
#
# Historial:
#   2024-01-15: versión 1
#
#################################################

#             0           1           2           3            4             5
regalos=("calcetines" "corbatas" "accesorios" "pulsera" "prismáticos" "camiseta de fútbol")
numeros=(2 432 6435 234 63455 3244 435 -6435 3244)

echo "A ver si es verdad: ${regalos[@]:1:3}"
echo "Este año me he portado muy bien y me han regalado: ${regalos[1]}"

echo "Este año me he portado muy bien y me han regalado: ${regalos[*]}"
echo "Este año me he portado muy bien y me han regalado: ${regalos[@]}"

echo "Mis regalos han sido: "
for reg in "${regalos[@]}"
do
	echo " - $reg"
done


# Número de elementos del array ->  ${#array[@]}
echo "Como me he portado tan bien, me han traído ${#regalos[@]} regalos"
echo "Y los índices son ${!regalos[@]}"


# MANIPULAR ARRAYS!!!
# Insertar elementos por el final
regalos+=("pantuflas")
regalos=("${regalos[@]}" "camiseta")

# Insertar elementos al principio
regalos=("cámara" ${regalos[@]})


regalos=("pantalones" ${regalos[@]} "abrigo")

# Insertar elemento en la posición 2
regalos=(${regalos[@]::2} "sombrero" ${regalos[@]:2})
#   echo "${@:1:5}"


# BORRAR
echo "------------------"
val=(234 6345 234 234 63546 3423 4234 12312)
unset val[2]
echo "Los índices son: ${!val[@]}"
unset val 


# DECLARAR LOS ARRAYS
v1=(34 52 34 23 6543 23432 323)

v2[0]=23423
v2[1]=6324
v2[2]=234
v2[1000]=23423
echo "Los índices son: ${!v2[@]}"

declare -a v3