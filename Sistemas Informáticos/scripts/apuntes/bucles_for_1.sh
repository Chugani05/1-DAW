#!/bin/bash

############################################
#
# Nombre: bucles_for_1.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: ejemplos simple de bucles en scripts
#
# Historial: 
#   2024-01-15: versión 1.0
#   2024-01-16: versión 2.0
#
############################################

# Bucle más simple de indicando los valores
for i in 1 2 3 4 5 6 7 8 9 10
do 
    echo "El valor de i is $i"
done


# Bucle puede ser cualquier valor
for i in "Monaco" "Francia" "Reino Unido" "Italia"
do 
     echo "El país es $i"
done


# Bucle con rango
for i in {1..20}
do
    echo "El valor de i es $i"
done


# Bucle con "salto" (de 1 a 20 de 3 en 3: 1, 4, 7...)
for i in {1..20..3}
do
    echo "El valor de i es $i"
done


# Bucle descendiente: 20, 17, 14...
for i in {20..1..-3}
do
    echo "El valor de i es $i"
done


# Bucle
for i in {0..100..5}
do 
    echo "El cuadrado de $i es $((i**2))"
done


# Bucle hasta un valor almacenado en una variable (creciente)
read "Indique el valor máximo: " n
#             init  end
for i in `seq  0    $n`
do
    echo "El cuadrado de $i es $((i**2))"
done

# Bucle hasta un valor almacenado en una variable (decreciente)
read "Indique el valor máximo: " n
#             init  step  end
for i in $(seq $n    -2    4)
do
    echo "El cuadrado de $i es $((i**2))"
done


# Sintaxis C-like 
# for (( var=ini; cond; actual ))
for ((i=0; i<10; i++)) 
do
	echo "Los valores de i son $i"
done